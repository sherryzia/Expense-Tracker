import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_routes.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/auth_submit_button.dart';
import '../widgets/auth_text_field.dart';

/// New Password screen — sets a fresh password and finishes the flow.
class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: AppStrings.newPasswordTitle,
      children: <Widget>[
        const AuthTextField(
          label: AppStrings.newPasswordLabel,
          isPassword: true,
          hiddenInitially: true,
        ),
        const SizedBox(height: 16),
        const AuthTextField(
          label: AppStrings.newPasswordConfirmLabel,
          isPassword: true,
          hiddenInitially: true,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 56),
        AuthSubmitButton(
          label: AppStrings.newPasswordChange,
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(AppRoutes.passwordSuccess),
        ),
      ],
    );
  }
}