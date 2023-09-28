import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../user/user_home.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const UserHomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Color brightWhite = Colors.white.withRed(255).withGreen(255).withBlue(255);
    return Container(
      color:brightWhite ,
      child: Center(
        child: Lottie.asset(
          'images/loading.json', // Replace with your Lottie animation file path
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}