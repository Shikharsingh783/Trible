import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trible/screens/profile_page.dart';
import 'package:trible/screens/signin.dart';
import 'package:trible/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key }) : super();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return false to prevent back navigation
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("S E T T I N G S"),
           leading: GestureDetector(
            onTap: () {
              // Handle leading icon tap here
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsetsDirectional.all(25),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("P R O F I L E",style: TextStyle(fontWeight: FontWeight.bold),),
                            Padding(
                              padding: EdgeInsets.only(right:15),
                              child: Icon(Icons.person),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsetsDirectional.only(start: 25,end: 25),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Consumer<ThemeProvider>(
                      builder: (context, themeProvider, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Dark Mode",style: TextStyle(fontWeight: FontWeight.bold),),
                          CupertinoSwitch(
                            value: themeProvider.isdarkMode,
                            onChanged: (value) => themeProvider.toggleTheme(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Spacer to push logout container to the bottom
                  const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:50),
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsetsDirectional.all(25),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          
                          backgroundColor: Theme.of(context).colorScheme.background,
                          title: Text("L O G O U T",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 18,fontWeight: FontWeight.w600),),
                          content: Text("Are you sure you want to log out?",style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the alert dialog
                              },
                              child: Container(
                                height: 35,
                                width: 70,
                                decoration: BoxDecoration(color: Theme.of(context).colorScheme.inversePrimary,borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.w700,color: Theme.of(context).colorScheme.secondary),))),
                            ),
                            TextButton(
                              onPressed: () async{
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
                              child: Container(
                                height: 35,
                                width: 65,
                                 decoration: BoxDecoration(color: Theme.of(context).colorScheme.inversePrimary,borderRadius: BorderRadius.circular(10)),
                              
                                child: Center(child: Text("Yes",style: TextStyle(color: Theme.of(context).colorScheme.secondary),))),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("L O G O U T",style: TextStyle(fontWeight: FontWeight.bold),),
                        Padding(
                          padding: EdgeInsets.only(right:15),
                          child: FaIcon(FontAwesomeIcons.signOutAlt,color: Colors.red,),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
