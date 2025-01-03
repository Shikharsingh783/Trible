import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:trible/data/community_data.dart';
import 'package:trible/firebase_options.dart';
import 'package:trible/provider/profile_image.dart';
import 'package:trible/screens/home.dart';
import 'package:trible/themes/theme_provider.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();


void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51MZej1SHW9a46lSlS36AI09ccrlQmQWk4cNs3OmMJM7v1ti0hDM7eBWbZLB7SGPfwNprRaUQUBcJC0Q5ljY2FcCJ005gW6cNdQ';
  await Stripe.instance.applySettings();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(providers:[
      ChangeNotifierProvider(create: (context)=> ThemeProvider()),
      ChangeNotifierProvider(create: (context)=>CommunityData()),
      ChangeNotifierProvider(create: (context)=> ProfileImageProvider()),
       Provider<RouteObserver<PageRoute>>(create: (_) => routeObserver),

      
    ],
    child: const MyApp(),
    )
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
       home: const home(),
      //ServiceCard(imagePath: "images/s1.png", service: "Responsive web design")
      // ServicePage(title: 'Website Development', community: 'School Community', i1: 'images/S1.png', s1: 'Responsive web design',)
      navigatorObservers: [routeObserver],
    );
  }
}

