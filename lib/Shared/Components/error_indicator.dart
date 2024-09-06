import 'package:flutter/material.dart';

import '../Themes/app_theme.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "SomeThing went Wrong !",
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: 20,
              color: AppTheme.navy,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
