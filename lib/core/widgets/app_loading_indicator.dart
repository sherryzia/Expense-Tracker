import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../extensions/context_extensions.dart';

/// App-wide overlay shown while a view is loading.
class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: context.colorScheme.primary),
          if (message != null) ...[
            const SizedBox(height: AppConstants.componentSpacing),
            Text(
              message!,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: context.colorScheme.onSurfaceVariant),
            ),
          ],
        ],
      ),
    );
  }
}