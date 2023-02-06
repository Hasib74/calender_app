import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToHomeScreen(context);
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Image(
            image: AssetImage("assets/logo/skf.png"),
          ),
        ),
      ),
    );
  }

  void _navigateToHomeScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
