import 'package:flutter/material.dart';
import 'package:trible/main.dart';
import 'package:trible/screens/NUS1.dart';
import 'package:trible/screens/signin.dart';

class signup extends StatelessWidget {
  signup({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm(BuildContext context){
    if(_formKey.currentState!.validate()){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> NUS1()));
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
                  onTap: () =>
                   _submitForm(context)
                  ,
                  child: Container(
                  height: 69,
                  width: 306,
                  decoration: BoxDecoration(color: const Color.fromRGBO(0, 224, 145, 1),borderRadius: BorderRadius.circular(5)),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text("Create Account",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),
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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
              },
              child: const Text("Already a user? Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white,decoration: TextDecoration.underline,decorationColor: Colors.white),))
            ],
          ),
        ),
      ),
    );
  }
}