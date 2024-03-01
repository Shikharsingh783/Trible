import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trible/screens/home.dart';
import 'package:trible/themes/theme_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), // Provide your ThemeProvider here
      child: const MyApp(),
    ),
  );
}


late Size mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     theme: Provider.of<ThemeProvider>(context).themeData,
       home: home()
      //ServiceCard(imagePath: "images/s1.png", service: "Responsive web design")
      // ServicePage(title: 'Website Development', community: 'School Community', i1: 'images/S1.png', s1: 'Responsive web design',)
    );
  }
}

