import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibration/vibration.dart';

import 'package:telware_cross_platform/core/constants/keys.dart';
import 'package:telware_cross_platform/core/theme/dimensions.dart';
import 'package:telware_cross_platform/features/user/view/widget/settings_input_widget.dart';
import 'package:telware_cross_platform/features/user/view/widget/settings_section.dart';
import 'package:telware_cross_platform/features/user/view/widget/toolbar_widget.dart';

class ProfileInfoScreen extends ConsumerStatefulWidget {
  static const String route = '/bio';

  const ProfileInfoScreen({super.key});

  @override
  ConsumerState<ProfileInfoScreen> createState() => _ProfileInfoScreen();
}

class _ProfileInfoScreen extends ConsumerState<ProfileInfoScreen> with SingleTickerProviderStateMixin {
  static const user = {
    "firstName": "Moamen",
    "lastName": "Hefny",
    "bio": "",
  };
  final TextEditingController _firstNameController = TextEditingController(text: user["firstName"]);
  final TextEditingController _secondNameController = TextEditingController(text: user["lastName"]);
  final TextEditingController _bioController = TextEditingController(text: user["bio"]);

  bool _showSaveButton = false;

  @override
  void initState() {
    super.initState();

    _firstNameController.addListener(_checkForChanges);
    _secondNameController.addListener(_checkForChanges);
    _bioController.addListener(_checkForChanges);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _secondNameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _checkForChanges() {
    bool hasChanged = _firstNameController.text != user["firstName"] ||
        _secondNameController.text !=  user["lastName"] ||
        _bioController.text != user["bio"];

    if (hasChanged != _showSaveButton) {
      setState(() {
        _showSaveButton = hasChanged;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolbarWidget(
        title: "Profile Info",
        actions: [
          if (_showSaveButton)
            IconButton(onPressed: _updateUserData,
                icon: const Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              SettingsSection(title: "Your Name",
                settingsOptions: const [],
                actions: [
                  SettingsInputWidget(key: Keys.profileInfoFirstNameInput,
                    controller:_firstNameController,
                    placeholder: "First Name",
                    shakeKey: Keys.profileInfoFirstNameShakeKey,
                  ),
                  SettingsInputWidget(key: Keys.profileInfoLastNameInput,
                    controller:_secondNameController,
                    placeholder: "Last Name",
                    shakeKey: Keys.profileInfoLastNameShakeKey,
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.sectionGaps),
              const SettingsSection(title: "Your channel",
                settingsOptions: [{"text": "Personal channel", "trailing": "Add"}],
              ),
              const SizedBox(height: Dimensions.sectionGaps),
              SettingsSection(title: "Your bio",
                settingsOptions: const [],
                actions: [
                  SettingsInputWidget(key: Keys.profileInfoBioInput,
                    controller:_bioController,
                    placeholder: "Write about yourself...", lettersCap: 70,)
                ],
                trailing: "You can add a few lines about yourself. Choose who can "
                    "see your bio in Settings",),
              const SizedBox(height: Dimensions.sectionGaps),
              const SettingsSection(title: "Your birthday",
                settingsOptions: [{"text": "Date of birth", "trailing": "Add"}],
                trailing: "Only your contacts can see your birthday. Change>",),
            ],
          )
      ),
    );
  }

  void _updateUserData() {
    if (_firstNameController.text == "") {
      return _shakeAndVibrate(Keys.profileInfoFirstNameShakeKey);
    }
    if (_secondNameController.text == "") {
      return _shakeAndVibrate(Keys.profileInfoLastNameShakeKey);
    }

    context.pop();
    // ref.listen<AuthState>(userViewModelProvider, (_, state) {})
  }

  void _shakeAndVibrate(shakeKey) {
    shakeKey.currentState?.shake();
    Vibration.hasVibrator().then((hasVibrator) {
      if (hasVibrator ?? false) {
        print("YESSSSSSSSSSss");
        Vibration.vibrate(duration: 100);
      }
    });
  }
}