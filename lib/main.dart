import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trible/widgets/buy_page.dart';
import 'package:trible/screens/home.dart';
import 'package:trible/screens/splash.dart';
import 'package:trible/widgets/service_page.dart';

void main() async{

   WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();
  runApp(const MyApp());
}

late Size mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: home()
      // ServicePage(title: 'Website Development', community: 'School Community', i1: 'images/S1.png', s1: 'Responsive web design',)
    );
  }
}

