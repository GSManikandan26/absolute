import 'package:absolute/home/homepage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Color brightWhite = Colors.white.withRed(255).withGreen(255).withBlue(255);

    return Container(
      color: brightWhite,
      child: Center(
        child: Image.asset(
          'images/splash.jpg',
          width: 300,
          height: 350,
        ),
      ),
    );
  }
}
