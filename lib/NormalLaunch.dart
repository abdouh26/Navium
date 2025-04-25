import 'dart:async';
import 'package:flutter/material.dart';
import 'package:navium/ChoicePage.dart';

class Normallaunch extends StatefulWidget {
  const Normallaunch({super.key});

  @override
  State<Normallaunch> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Normallaunch> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(_createRoute());
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder:
          (context, animation, secondaryAnimation) => const ChoicePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final fade = Tween(begin: 0.0, end: 1.0).animate(animation);
        return FadeTransition(opacity: fade, child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/Welcome.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
