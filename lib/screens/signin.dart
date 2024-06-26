import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trible/main.dart';
import 'package:trible/auth/auth.dart';
import 'package:trible/screens/forgot_password.dart';
import 'package:trible/screens/home.dart';
import 'package:trible/screens/signup.dart';
import 'package:trible/themes/theme_provider.dart';


class signin extends StatefulWidget {
  signin({super.key, required void Function() ontap});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  bool _isSecurePassword = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController  _email = TextEditingController();
  final TextEditingController  _password = TextEditingController();

  @override
void initState() {
  _email.text = '';
  _password.text = '';
  super.initState();
}

  signInWithEmailAndPassword()async{
    try {
      setState(() {
        isLoading = true;
      });
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _email.text,
    password: _password.text,
  );

// Access the current user object to get the UID
    final User? user = FirebaseAuth.instance.currentUser;
    final String? uid = user?.uid;

     // Print the UID of the signed-in user
    print("UID: $uid");


   setState(() {
        isLoading = false;
      });
       ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Sign-in successful",style: TextStyle(color: Colors.black),),backgroundColor: Colors.green,),
    );
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => home()), 
    );
} on FirebaseAuthException catch (e) {
   setState(() {
        isLoading = false;
      });
  if (e.code == 'user-not-found') {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("No user found for that email"))
    );
  } else if (e.code == 'wrong-password') {
     print("wrong password");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("wrong password is provided"))
      
    );
  }
} catch (e) {
  print("Unexpected error: $e");
}
  }

  // void _submitform(BuildContext context){
  //   if(_formKey.currentState!.validate()){
  //     // Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
  //     signInWithEmailAndPassword();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool darkMode = themeProvider.isdarkMode;

    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right:mq.width*.555),
                child: Text("Sign In",style: TextStyle(fontWeight: FontWeight.w700,color: darkMode ?  const Color.fromRGBO(0, 224, 145, 1):Colors.black,fontSize: 32),),
              ),
              Padding(
                padding: EdgeInsets.only(right:mq.width*.42),
                child: Text("Welcome back",style: TextStyle(color:
                darkMode ?Colors.white: Colors.grey.shade900  ,fontSize: 24,fontWeight: FontWeight.w300),),
              ),
              const SizedBox(height: 40,),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right:mq.width*.75),
                    child: Text("Email",style: TextStyle( color: Theme.of(context).colorScheme.secondary,fontSize: 22),),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: 380,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: _email,
                      validator:(value) {
                        if(value!.isEmpty){
                          return "Email cannot be empty";
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(color: Colors.yellow),
                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(0, 224, 145, 1))),
                      border: OutlineInputBorder(),filled: true,fillColor: Colors.white,),
                              ),
                  ),
            ]),
            const SizedBox(height: 20,),
             Column(
               children: [
                Padding(
                  padding: EdgeInsets.only(right:mq.width*.64),
                  child: Text("Password",style: TextStyle(
                     color: Theme.of(context).colorScheme.secondary,fontSize: 22)),
                ),
                const SizedBox(height: 5,),
                SizedBox(
                  width: 380,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _password,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Password cannot be empty";
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    obscureText: _isSecurePassword,
                      decoration: InputDecoration(
                        suffixIcon: togglePassword(),
                        errorStyle: const TextStyle(color: Colors.yellow),
                         focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(0, 224, 145, 1))),
                        border: const OutlineInputBorder(),filled: true,fillColor: Colors.white,),
                    ),
                ),
            ]),
            const SizedBox(height: 50,),
            Stack(
              children:[ 
                
                GestureDetector(
                  onTap: (){
                     if(_formKey.currentState!.validate()){
                      print("login done");
      signInWithEmailAndPassword();
    }
                  },
                  child: Container(
                  height: 69,
                  width: 306,
                  decoration: BoxDecoration(color: const Color.fromRGBO(0, 224, 145, 1),borderRadius: BorderRadius.circular(5)),
                  child: Align(
                    alignment: Alignment.center,
                    child: isLoading?const Center(child: CircularProgressIndicator(color: Colors.black,)): const Text("Login",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),
                          ),
                ),
              
            ]),
            const SizedBox(height:40),

              Divider(indent: 25, endIndent: 25, thickness: 2, color: Theme.of(context).colorScheme.secondary),
              
            const SizedBox(height:40),
            GestureDetector (
              onTap: () async{ 
                 await AuthService().signInWithGoogle();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
              },
              child: Container(
                height: 69,
                width:306,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: darkMode ? Colors.white: Colors.black ,width: 2)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Continue with google",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.w500,fontSize: 20),)),
              ),
            ),
            const SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
              },
              child: Text("New here? Sign up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Theme.of(context).colorScheme.secondary,decoration: TextDecoration.underline,decorationColor: Theme.of(context).colorScheme.secondary),)),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Forgotpassword()));
                },
                child: Text("Forgot Password?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Theme.of(context).colorScheme.secondary,decoration: TextDecoration.underline,decorationColor: Theme.of(context).colorScheme.secondary)))
            ],
          ),
        ),
      ),
    );
  }
  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
         _isSecurePassword =! _isSecurePassword;
      });
    }, icon: _isSecurePassword?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
    color: Colors.black,
    );
}
}