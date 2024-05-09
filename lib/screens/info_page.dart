import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trible/database/profile_database.dart';
import 'package:trible/screens/NUS2.dart';

class InfoPage extends StatefulWidget {
  InfoPage({super.key});

  @override
  State<InfoPage> createState() => _NUS1State();
}

class _NUS1State extends State<InfoPage> {
  final ProfileDatabase db = ProfileDatabase();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _twitter = TextEditingController();
  TextEditingController _github = TextEditingController();
  TextEditingController _linkedin = TextEditingController();

  @override
  void dispose()
  {
    _twitter.dispose();
    _github.dispose();
    _linkedin.dispose();
    super.dispose();
  }

  


  void _submitForm(BuildContext context)async{



    if (_formKey.currentState!.validate()) {
    // Get the current user's UID
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    
    // Check if userId is not null before proceeding
    if (userId != null) {
      // Add user details using userId
      await db.addProfileDetails(
        userId, // Pass the userId as the 4th argument
        _twitter.text.trim(),
        _github.text.trim(),
        _linkedin.text.trim(),
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => NUS2()),
        (route) => false,
      );
    } else {
      print("Error: Current user ID is null");
    }
  }
  }

  @override
  Widget build(BuildContext context) {
   Size mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color.fromRGBO(30, 37, 40, 1),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
               Padding(
                 padding: EdgeInsets.only(right:mq.width*.25),
                 child: const Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Setup Profile",style: TextStyle(fontSize: 32,fontWeight:FontWeight.w600,color: Color.fromRGBO(0, 224, 145, 1)),),
                    Text("Tell us about yourself",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight:FontWeight.w300),),
                   
                  ],
                         ),
               ),
               const SizedBox(height:70),
                   Padding(
                    padding: EdgeInsets.only(right:mq.width*.56),
                    child: const Text("Twitter Profile",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: 380,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: _twitter,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Profile cannot be empty";
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
                  const SizedBox(height: 25,),

                    Padding(
                    padding: EdgeInsets.only(right:mq.width*.56),
                    child: const Text("Github Profile",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: 380,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: _github,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Profile cannot be empty";
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
                  const SizedBox(height: 25,),
                   Padding(
                    padding: EdgeInsets.only(right:mq.width*.52),
                    child: const Text("LinkedIn Profile",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: 380,

                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: _linkedin,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Profile cannot be empty";
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
                  const SizedBox(height: 60,),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        _submitForm(context);

                        
                      }
                      ,
                      child: Container(
                                height: 69,
                                width: 306,
                                decoration: BoxDecoration(color: const Color.fromRGBO(0, 224, 145, 1),borderRadius: BorderRadius.circular(5)),
                                child: const Align(
                      alignment: Alignment.center,
                      child: Text("Continue",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),
                              ),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NUS2()),(route)=>false);
                    },
                    child: Text("Skip, set up later",style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.secondary,decoration: TextDecoration.underline,decorationColor: Theme.of(context).colorScheme.secondary),))
            ],
          ),
        ),
      ),
    );
  }
}