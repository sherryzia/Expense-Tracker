import 'package:flutter/material.dart';

import 'core/configs/app_theme.dart';
import 'core/constants/app_routes.dart';
import 'core/constants/app_strings.dart';
import 'features/presentation/screens/splash/presentation/screens/splash_screen.dart';
import 'features/presentation/screens/onboarding/presentation/screens/onboarding_screen.dart';
import 'features/presentation/screens/auth/presentation/screens/login_screen.dart';
import 'features/presentation/screens/auth/presentation/screens/create_account_screen.dart';
import 'features/presentation/screens/auth/presentation/screens/forgot_password_screen.dart';
import 'features/presentation/screens/auth/presentation/screens/security_pin_screen.dart';
import 'features/presentation/screens/auth/presentation/screens/new_password_screen.dart';
import 'features/presentation/screens/auth/presentation/screens/password_success_screen.dart';
import 'features/presentation/screens/auth/presentation/screens/security_fingerprint_screen.dart';
import 'features/presentation/screens/auth/presentation/screens/landing_screen.dart';
import 'features/presentation/screens/home/presentation/screens/dashboard_screen.dart';
import 'features/presentation/screens/home/presentation/screens/account_balance_screen.dart';
import 'features/presentation/screens/home/presentation/screens/notification_screen.dart';

/// Root widget of the application.
class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case AppRoutes.onboarding:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const OnboardingScreen(),
            );
          case AppRoutes.landing:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const LandingScreen(),
            );
          case AppRoutes.login:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const LoginScreen(),
            );
          case AppRoutes.createAccount:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const CreateAccountScreen(),
            );
          case AppRoutes.forgotPassword:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const ForgotPasswordScreen(),
            );
          case AppRoutes.securityPin:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const SecurityPinScreen(),
            );
          case AppRoutes.newPassword:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const NewPasswordScreen(),
            );
          case AppRoutes.passwordSuccess:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const PasswordSuccessScreen(),
            );
          case AppRoutes.securityFingerprint:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const SecurityFingerprintScreen(),
            );
          case AppRoutes.accountBalance:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const AccountBalanceScreen(),
            );
          case AppRoutes.notifications:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const NotificationScreen(),
            );
          case AppRoutes.home:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const DashboardScreen(),
            );
          case AppRoutes.splash:
          default:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => const SplashScreen(),
            );
        }
      },
    );
  }
}