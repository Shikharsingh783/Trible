import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:trible/auth/auth.dart';
import 'package:trible/themes/theme_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51MZej1SHW9a46lSlS36AI09ccrlQmQWk4cNs3OmMJM7v1ti0hDM7eBWbZLB7SGPfwNprRaUQUBcJC0Q5ljY2FcCJ005gW6cNdQ';
  
  // Initialize Firebase
  await Firebase.initializeApp();
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
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
       home:const AuthPage()
      //ServiceCard(imagePath: "images/s1.png", service: "Responsive web design")
      // ServicePage(title: 'Website Development', community: 'School Community', i1: 'images/S1.png', s1: 'Responsive web design',)
    );
  }
}

