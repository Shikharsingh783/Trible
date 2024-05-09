import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trible/database/profile_database.dart';
import 'package:trible/screens/info_page.dart';

class NUS1 extends StatefulWidget {
  const NUS1({super.key});

  @override
  State<NUS1> createState() => _NUS1State();
}

class _NUS1State extends State<NUS1> {

  final ProfileDatabase db = ProfileDatabase();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _service = TextEditingController();

  @override
  void dispose()
  {
    _firstName.dispose();
    _lastName.dispose();
    _service.dispose();
    super.dispose();
  }


  void _submitForm(BuildContext context) async {
  if (_formKey.currentState!.validate()) {
    // Get the current user's UID
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    
    // Check if userId is not null before proceeding
    if (userId != null) {
      // Add user details using userId
      await db.addUserDetails(
        userId, // Pass the userId as the 4th argument
        _firstName.text.trim(),
        _lastName.text.trim(),
        _service.text.trim(),
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => InfoPage()),
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
                    padding: EdgeInsets.only(right:mq.width*.63),
                    child: const Text("First Name",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: 380,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: _firstName,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Name cannot be empty";
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
                    padding: EdgeInsets.only(right:mq.width*.64),
                    child: const Text("Last Name",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: 380,
                    child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                      controller: _lastName,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Name cannot be empty";
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
                    padding: EdgeInsets.only(right:mq.width*.5),
                    child: const Text("What do you do?",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: 380,
    
                    child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                      controller: _service,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Work cannot be empty";
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
            ],
          ),
        ),
      ),
    );
  }
}