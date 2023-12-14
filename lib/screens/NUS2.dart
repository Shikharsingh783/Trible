import 'package:flutter/material.dart';
import 'package:trible/main.dart';
import 'package:trible/screens/home.dart';

class NUS2 extends StatelessWidget {
  NUS2({super.key});

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

void _submitfrom(BuildContext context){
  if(_formKey.currentState!.validate()){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
  }
}


  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
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
                 padding: EdgeInsets.only(right:mq.width*.13),
                 child: const Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Find a Tribe",style: TextStyle(fontSize: 32,fontWeight:FontWeight.w600,color: Color.fromRGBO(0, 224, 145, 1)),),
                    Text("Join your first community",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight:FontWeight.w300),),
                   
                  ],
                         ),
               ),
               const SizedBox(height:70),
                   Padding(
                    padding: EdgeInsets.only(right:mq.width*.49),
                    child: const Text("Enter invite code",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: 380,
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Code cannot be empty";
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
                      onTap: () => _submitfrom(context),
                      child: Container(
                                height: 69,
                                width: 306,
                                decoration: BoxDecoration(color: const Color.fromRGBO(0, 224, 145, 1),borderRadius: BorderRadius.circular(5)),
                                child: const Align(
                      alignment: Alignment.center,
                      child: Text("Enter",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),
                              ),
                    ),
                          
                  ),
                  const SizedBox(height: 25,),
                   GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
                    },
                     child: Container(
                                   height: 69,
                                   width:306,
                                   
                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.white,width: 1.2)),
                                   child: const Align(
                                     alignment: Alignment.center,
                                     child: Text("Not Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),
                                 ),
                   ),
            ],
          ),
        ),
      ),
    );
  }
}