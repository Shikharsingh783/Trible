import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trible/screens/settings_page.dart';
import 'package:trible/screens/signin.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Column(
            children: [
              //logo
              DrawerHeader(
                child: Center(
                  child: Text("T  R  I  B  E  S",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 25,fontWeight:FontWeight.w700),),
                ),
              ),
              const SizedBox(height: 10,),
              //home tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title:Text("H O M E",style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                  leading: Icon(Icons.home,color: Theme.of(context).colorScheme.secondary,),
                  onTap: () =>Navigator.pop(context),
                ),
              ),
              //settings tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text("S E T T I N G S",style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                  leading: Icon(Icons.settings,color:Theme.of(context).colorScheme.secondary ,),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsPage())),
                ),
              ),
            ],
          ),

          //mode tile
          ListTile(),


          // Log Out tile
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,bottom:80),
                  child: ListTile(
                    title: Text("L O G O U T",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.w500),),
                    leading: Icon(Icons.logout, color: Colors.red,),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      print("log out");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Logged out successfully!", style: TextStyle(color: Colors.black),),
                          backgroundColor: Colors.red,
                        ),
                      );
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => signin(ontap: () {  },)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
