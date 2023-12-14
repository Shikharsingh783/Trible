import 'package:flutter/material.dart';
import 'package:trible/screens/NUS2.dart';

class NUS1 extends StatelessWidget {
  NUS1({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm(BuildContext context){
    if(_formKey.currentState!.validate()){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>NUS2()));
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
                    padding: EdgeInsets.only(right:mq.width*.44),
                    child: const Text("What is your name?",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: 380,
                    child: TextFormField(
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
                      onTap: () =>
                        _submitForm(context)
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