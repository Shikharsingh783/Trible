import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trible/screens/start.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => start())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(30, 37, 40, 1),
      ),
      child: const Center(
        child: Text(
          "Trible",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 224, 145, 1),
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
