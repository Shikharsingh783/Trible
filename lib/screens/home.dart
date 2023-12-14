import 'package:flutter/material.dart';
import 'package:trible/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trible/pages/auth.dart';


class home extends StatelessWidget {
  home({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut()async{
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:const Color.fromRGBO(30, 37, 40, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left:mq.width*.08),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                Text("Tribes",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight:FontWeight.w600),),
              Text("Your Communities",style: TextStyle(color: Color.fromRGBO(0, 224, 145, 1),fontSize: 20,fontWeight:FontWeight.w300 ),)
                    ]),
            )
            
          ],
        ),
      ),
    );
  }
}