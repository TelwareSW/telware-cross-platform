import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:telware_cross_platform/features/stories/view/screens/show_taken_image_screen.dart';
import '../widget/take_photo_row.dart';
import '../widget/toggleCameraMode.dart';

class AddMyImageScreen extends StatefulWidget {
  static const String route = '/add-my-image';
  final String destination;
  const AddMyImageScreen({
    super.key,
    this.destination = 'story',
  });

  @override
  State<AddMyImageScreen> createState() => _AddMyImageScreenState();
}

class _AddMyImageScreenState extends State<AddMyImageScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  final String _selectedMode = 'Photo';
  int _currentCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        if (kDebugMode) {
          debugPrint('No cameras available');
        }
        return;
      }
      _initializeController(cameras[_currentCameraIndex]);
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Error initializing camera: $e');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Unable to access camera. Please check permissions.')),
      );
    }
  }

  Future<File> _saveImageBytesToFile(Uint8List imageBytes) async {
    final directory = await getTemporaryDirectory();
    final randomNumber = Random().nextInt(100000);
    final filePath = '${directory.path}/taken_story_$randomNumber.png';
    final file = File(filePath);
    await file.writeAsBytes(imageBytes);
    return file;
  }

  Future<void> _initializeController(CameraDescription camera) async {
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller?.initialize().then((_) {
      setState(() {});
    });
  }

  void _toggleCamera() async {
    final cameras = await availableCameras();
    if (cameras.length > 1) {
      _currentCameraIndex = (_currentCameraIndex + 1) % cameras.length;
      await _controller?.dispose();
      _initializeController(cameras[_currentCameraIndex]);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _captureImage() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller!.takePicture();
      Uint8List imageBytes = await image.readAsBytes();
      File savedFile = await _saveImageBytesToFile(imageBytes);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowTakenImageScreen(
              image: savedFile, destination: widget.destination),
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Error capturing image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Positioned.fill(
                  child: CameraPreview(_controller!),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TakePhotoRow(
                            selectedMode: _selectedMode,
                            onCapture: _captureImage,
                            onToggle: _toggleCamera,
                            destination: widget.destination,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ToggleCameraMode(
                            selectedMode: _selectedMode,
                            constraints: constraints,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
