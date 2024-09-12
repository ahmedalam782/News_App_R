import 'package:flutter/material.dart';

import '../../../Shared/Components/app_background_image.dart';
import '../../../home/view/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBackgroundImage(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Image.asset(
              "assets/images/logo.png",
              width: double.infinity,
            ),
            const Spacer(),
            Image.asset("assets/images/branding_sp.png"),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
