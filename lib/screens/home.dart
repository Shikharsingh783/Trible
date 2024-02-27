import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trible/screens/signin.dart';

class home extends StatelessWidget {
  home({Key? key});
  final user  = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 37, 40, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: mq.width * 0.1),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tribes",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Your Communities",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 224, 145, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  
                   Padding(
                     padding: EdgeInsets.only(left:mq.width*.35),
                     child: IconButton(
                                 onPressed: () async {
                                   await FirebaseAuth.instance.signOut();
                                   print("log out");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(
                      content: Text("Logged out successfully!",style: TextStyle(color: Colors.black),),
                      backgroundColor: Colors.red,
                                     ),
                                   );
                                   Navigator.of(context).pushReplacement(
                                     MaterialPageRoute(builder: (context) => signin()),
                                   );
                                 },
                                 icon: Icon(
                                   Icons.logout,
                                   color: Colors.red,
                                 ),
                               ),
                   ),
                ],
              ),
            ),
           

            Padding(
              padding: EdgeInsets.only(left:mq.width*.12,top:mq.height*.7),
              child: Row(
                children: [
                  Text("Logged in as  ::  ",style: TextStyle(color: Colors.white,fontSize: 18),),
                  Text(
                    user?.email ?? "No user email",
                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

