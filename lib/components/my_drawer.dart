import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                  child: Icon(
                    Icons.music_note,
                    size: 40,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              //home tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: const Icon(Icons.home),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              //settings tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading: const Icon(Icons.settings),
                  // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsPage())),
                ),
              ),
            ],
          ),
          // Log Out tile
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,bottom:80),
                  child: ListTile(
                    title: Text("L O G O U T"),
                    leading: Icon(Icons.logout, color: Colors.red,),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      print("log out");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Logged out successfully!", style: TextStyle(color: Colors.black),),
                          backgroundColor: Colors.red,
                        ),
                      );
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => signin()),
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
