import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trible/screens/home.dart';
import 'package:trible/screens/signin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator(color: Colors.black,);
        }else{
          if(snapshot.hasData){
            return home();
          }else{
            return signin(); 
          }
        }
      },
      ),
    );
  }
}

class AuthService {
  signInWithGoogle()async{
    // begin interaction sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();


    //ontain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credentials for user
    final Credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );
    

    //finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(Credential);

}}