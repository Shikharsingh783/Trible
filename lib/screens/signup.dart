import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trible/main.dart';
import 'package:trible/auth/auth.dart';
import 'package:trible/screens/NUS1.dart';
import 'package:trible/screens/signin.dart';

class signup extends StatefulWidget {
  signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
   final TextEditingController  _email = TextEditingController();
  final TextEditingController  _password = TextEditingController();

  createUserWithEmailAndPassword()async{
    try {
      setState(() {
        isLoading = true;
      });
   await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _email.text,
    password: _password.text,
  );
  setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("User Registered",style: TextStyle(color: Colors.black),),backgroundColor: Color.fromRGBO(0, 244, 145, 1),),
    );
       Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NUS1()), // Replace HomeScreen with your actual home screen class
    );
} on FirebaseAuthException catch (e) {
  setState(() {
        isLoading = false;
      });
  if (e.code == 'weak-password') {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("The password provided is too weak."))
    );
  } else if (e.code == 'email-already-in-use') {
     return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("A account already exists for that email."))
    );
  }
} catch (e) {
  setState(() {
        isLoading = false;
      });
  print(e);
}
  }

  // void _submitForm(BuildContext context){
  //   if(_formKey.currentState!.validate()){
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=> NUS1()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 37, 40, 1),
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
                padding: EdgeInsets.only(right:mq.width*.52),
                child: const Text("Sign Up",style: TextStyle(fontWeight: FontWeight.w700,color: Color.fromRGBO(102, 221, 152, 1),fontSize: 32),),
              ),
              Padding(
                padding: EdgeInsets.only(right:mq.width*.23),
                child: const Text("Create a new account",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w300),),
              ),
              const SizedBox(height: 40,),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right:mq.width*.74),
                    child: const Text("Email",style: TextStyle(color: Colors.white,fontSize: 22),),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 380,
                    
                    child: TextFormField(
                      controller: _email,
                      validator: (value){
                        if(value!.isEmpty){
                          return "please enter a email";
                        }
                        RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if(!emailRegExp.hasMatch(value)){
                          return "please enter a valid email";
                           }
                        return null;
                      },
                      cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
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
                  child: const Text("Password",style: TextStyle(color: Colors.white,fontSize: 22)),
                ),
                const SizedBox(height: 5,),
                SizedBox(
                  
                  width: 380,
                  child: TextFormField(
                    controller: _password,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password cannot be empty";
                      }
                      if(value.length < 7){
                        return "Minimum 8 characters required";
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    obscureText: true,
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(color: Colors.yellow),
                         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(0, 224, 145, 1))),
                        border: OutlineInputBorder(),filled: true,fillColor: Colors.white,),
                    ),
                ),
            ]),
            const SizedBox(height: 50,),
            Stack(
              children:[ 
                
                GestureDetector(
                  onTap: (){
                     if(_formKey.currentState!.validate()){
                      createUserWithEmailAndPassword();
    }
                  }
                  ,
                  child: Container(
                  height: 69,
                  width: 306,
                  decoration: BoxDecoration(color: const Color.fromRGBO(0, 224, 145, 1),borderRadius: BorderRadius.circular(5)),
                  child: Align(
                    alignment: Alignment.center,
                    child:isLoading? Center(child: const CircularProgressIndicator(color: Colors.black,)): const Text("Create Account",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),
                          ),
                ),
              
            ]),
            const SizedBox(height:40),
            const Divider(
              indent: 25,
              endIndent: 25,
              thickness: 2,
              color: Colors.white,
            ),
            const SizedBox(height:40),
            GestureDetector(
              onTap: () => AuthService().signInWithGoogle(),
              child: Container(
                height: 69,
                width:306,
                
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.white,width: 2)),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Continue with google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),
              ),
            ),
            const SizedBox(height: 50,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>signin(ontap: () {  },)));
              },
              child: const Text("Already a user? Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white,decoration: TextDecoration.underline,decorationColor: Colors.white),))
            ],
          ),
        ),
      ),
    );
  }
}