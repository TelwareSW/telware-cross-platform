import 'package:flutter/material.dart';
import 'core/theme/auth_theme.dart';
import 'features/auth/view/screens/user_profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:telware_cross_platform/core/view/screen/splash_screen.dart';
import 'package:telware_cross_platform/features/auth/view/screens/log_in_screen.dart';
import 'package:telware_cross_platform/features/auth/view_model/auth_view_model.dart';
import 'core/models/user_model.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/view/screens/sign_up_screen.dart';
import 'features/auth/view/screens/verification_screen.dart';

void main() async {
  await init();
  runApp(const ProviderScope(child: TelWare()));
}

Future<void> init() async {
  Hive.registerAdapter(UserModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<String>('auth-token');
  await Hive.openBox<UserModel>('auth-user');
}

class TelWare extends ConsumerStatefulWidget {
  const TelWare({super.key});

  @override
  ConsumerState<TelWare> createState() => _TelWareState();
}

class _TelWareState extends ConsumerState<TelWare> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authViewModelProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TelWare',
      theme: appTheme,
      routes: {
        SplashScreen.route: (context) => const SplashScreen(),
        LogInScreen.route: (context) => const LogInScreen(),
        SignUpScreen.route: (context) => const SignUpScreen(),
        VerificationScreen.route: (context) => const VerificationScreen(),
      },
      initialRoute: SplashScreen.route,
    );
  }
}
