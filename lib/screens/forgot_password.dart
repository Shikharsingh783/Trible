import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trible/main.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final TextEditingController  _email = TextEditingController();

   @override
void initState() {
  _email.text = '';
  super.initState();
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
                        padding: EdgeInsets.only(right:mq.width*.75,top: mq.height*.15),
                        child: const Text("Email",style: TextStyle(color: Colors.white,fontSize: 22),),
                      ),
                      const SizedBox(height: 5,),
                      SizedBox(
                        width: 380,
                        child: TextFormField(
                          controller: _email,
                          validator:(value){
                            if(value!. isEmpty){
                              return "Email cannot be empty";
                            }
                            RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if(!emailRegExp.hasMatch(value)){
                              return "Enter a valid Email";
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
                      const SizedBox(height: 50,),
                      Center(
                        child: GestureDetector(
                          
                          onTap: (){
                             if(_formKey.currentState!.validate()){
                              auth.sendPasswordResetEmail(email: _email.text.toString()).then((value){
                                ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Password reset email sent successfully."),
      ),
    );
                              }).catchError((onError){
                                 ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error sending password reset email.",style: TextStyle(color: Colors.black),),
        backgroundColor: const Color.fromARGB(255, 255, 238, 86),
      ),
    );
                              });
                          }},
                          child: Container(
                          height: 69,
                          width: 306,
                          decoration: BoxDecoration(color: const Color.fromRGBO(0, 224, 145, 1),borderRadius: BorderRadius.circular(5)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Submit",style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),
                                  ),
                        ),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}