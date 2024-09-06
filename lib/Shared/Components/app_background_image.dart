import 'package:flutter/material.dart';
import 'package:news_app_route/Shared/Themes/app_theme.dart';

class AppBackgroundImage extends StatelessWidget {
  const AppBackgroundImage({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/bg_default.png",
          ),
        ),
      ),
      child: child,
    );
  }
}
