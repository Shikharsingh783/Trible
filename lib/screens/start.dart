import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trible/main.dart';
import 'package:trible/screens/signin.dart';
import 'package:trible/screens/signup.dart';
import 'package:trible/themes/theme_provider.dart';

class start extends StatelessWidget {
  
  start({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool darkMode = themeProvider.isdarkMode;


    
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          children: [
             Text("Trible",style: TextStyle(fontWeight: FontWeight.w700,color: darkMode ? const Color.fromRGBO(30, 37, 40, 1) : const Color.fromRGBO(0, 224, 145, 1),fontSize: 37,decoration: TextDecoration.none),),
             const SizedBox(height: 120,),
             Padding(
               padding: EdgeInsets.only(right:mq.width*.43),
               child: Text("Welcome",style: TextStyle(color: darkMode ? Colors.grey.shade900 : Colors.white,fontSize: 34,fontWeight: FontWeight.w700 ),),
             ),
             const SizedBox(height: 2,),
             Padding(
               padding: EdgeInsets.only(right:mq.width*.26),
               child: Text("Join a community\nwhere your work\nmatters.",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 28,fontWeight: FontWeight.w400),),
             ),
             const SizedBox(height: 180,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => signin(ontap: () {  },)));
                },
                child: Container(
                          height: 69,
                          width:306,
                          
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Theme.of(context).colorScheme.primary,width: 1.2)),
                          child: Align(
                alignment: Alignment.center,
                child: Text("Sign In",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.w500,fontSize: 20),)),
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
                decoration: BoxDecoration( color: darkMode ? const Color.fromRGBO(30, 37, 40, 1) : const Color.fromRGBO(0, 224, 145, 1),borderRadius: BorderRadius.circular(5)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Create Account",style: TextStyle(color: darkMode ? Colors.white : Colors.black,fontSize: 20,fontWeight: FontWeight.w600),)),
              ),
           ),
          ],
        ),
      ),
    );
  }
}