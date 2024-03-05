import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  final String image;
  const MyLogo({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: 45,
                    width: 45,
                  ),
                ),
              ],
    );
  }
}