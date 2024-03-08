import 'package:flutter/material.dart';

 class MyTextfeild extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  const MyTextfeild({super.key, required this.hintText, required this.obsecureText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),

        hintText: hintText,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary)
        
      ),
    );
  }
}