import 'package:flutter/material.dart';
import 'package:trible/main.dart';
import 'package:trible/pages/auth.dart';
import 'package:trible/screens/home.dart';
import 'package:trible/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart'; 

class signin extends StatefulWidget {
  signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  String? errorMessage = "";

  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword()async{
    try{
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text
      );
    } on FirebaseAuthException catch(e){
      setState((){
        errorMessage = e.message;
      });
    }
  }

  Future<void> createuserWithEmailAndPassword()async{
    try{
      await Auth().createUserWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
    } on FirebaseAuthException catch (e){
       setState((){
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage(){
    return Text(errorMessage == ''?'':'Humm? $errorMessage');
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitform(BuildContext context){
    if(_formKey.currentState!.validate()){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
    }
  }

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
                padding: EdgeInsets.only(right:mq.width*.555),
                child: const Text("Sign In",style: TextStyle(fontWeight: FontWeight.w700,color: Color.fromRGBO(0, 224, 145, 1),fontSize: 32),),
              ),
              Padding(
                padding: EdgeInsets.only(right:mq.width*.42),
                child: const Text("Welcome back",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w300),),
              ),
              const SizedBox(height: 40,),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right:mq.width*.75),
                    child: const Text("Email",style: TextStyle(color: Colors.white,fontSize: 22),),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: 380,
                    child: TextFormField(
                      controller: _controllerEmail,
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
                  child: const Text("Password",style: TextStyle(color: Colors.white,fontSize: 22)),
                ),
                const SizedBox(height: 5,),
                SizedBox(
                  width: 380,
                  child: TextFormField(
                    controller: _controllerPassword,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Password cannot be empty";
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
                  onTap: () =>  _submitform(context),
                  child: Container(
                  height: 69,
                  width: 306,
                  decoration: BoxDecoration(color: const Color.fromRGBO(0, 224, 145, 1),borderRadius: BorderRadius.circular(5)),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),
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
            Container(
              height: 69,
              width:306,
              
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.white,width: 2)),
              child: const Align(
                alignment: Alignment.center,
                child: Text("Continue with google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),
            ),
            const SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
              },
              child: const Text("New here? Sign up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white,decoration: TextDecoration.underline,decorationColor: Colors.white),))
            ],
          ),
        ),
      ),
    );
  }
}