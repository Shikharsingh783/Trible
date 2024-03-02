import 'package:flutter/material.dart';
import 'package:trible/main.dart';
import 'package:trible/screens/signin.dart';
import 'package:trible/screens/signup.dart';

class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          children: [
             const Text("Trible",style: TextStyle(fontWeight: FontWeight.w700,color: Color.fromRGBO(0, 224, 145, 1),fontSize: 37,decoration: TextDecoration.none),),
             const SizedBox(height: 120,),
             Padding(
               padding: EdgeInsets.only(right:mq.width*.43),
               child: const Text("Welcome",style: TextStyle(color:Colors.white,fontSize: 34,fontWeight: FontWeight.w700 ),),
             ),
             const SizedBox(height: 2,),
             Padding(
               padding: EdgeInsets.only(right:mq.width*.26),
               child: const Text("Join a community\nwhere your work\nmatters.",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w400),),
             ),
             const SizedBox(height: 180,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => signin(ontap: () {  },)));
                },
                child: Container(
                          height: 69,
                          width:306,
                          
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.white,width: 1.2)),
                          child: const Align(
                alignment: Alignment.center,
                child: Text("Sign In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),
                        ),
              ),
          const SizedBox(height: 25,),
           GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>signup()));
            },
             child: Container(
                height: 69,
                width: 306,
                decoration: BoxDecoration(color: const Color.fromRGBO(0, 224, 145, 1),borderRadius: BorderRadius.circular(5)),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Create Account",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),
              ),
           ),
          ],
        ),
      ),
    );
  }
}