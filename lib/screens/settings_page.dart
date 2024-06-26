import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trible/screens/profile_page.dart';
import 'package:trible/screens/start.dart';
import 'package:trible/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key }) : super();

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    bool darkMode = themeProvider.isdarkMode;

    return WillPopScope(
      onWillPop: () async {
        // Return false to prevent back navigation
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("S  E  T  T  I  N  G  S",style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
           leading: GestureDetector(
            onTap: () {
              // Handle leading icon tap here
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white54,),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfilePage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsetsDirectional.all(25),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("P R O F I L E",style: TextStyle(fontWeight: FontWeight.bold,color: darkMode ? Colors.black : Colors.white),),
                            Padding(
                              padding: EdgeInsets.only(right:15),
                              child: Icon(Icons.person,color: darkMode ? Colors.black : Colors.white,),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsetsDirectional.only(start: 25,end: 25),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Consumer<ThemeProvider>(
                      builder: (context, themeProvider, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Dark Mode",style: TextStyle(fontWeight: FontWeight.bold,color: darkMode ? Colors.black : Colors.white),),
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
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsetsDirectional.all(25),
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
                          
                          backgroundColor: Theme.of(context).colorScheme.surface,
                          title: const Text("L O G O U T",style: TextStyle(color:Color.fromRGBO(0, 224, 145, 1),fontSize: 18,fontWeight: FontWeight.w600),),
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
                        Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => start()), // Ensure to replace 'start()' with the appropriate start page widget.
    (route) => false,
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
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("L O G O U T",style: TextStyle(fontWeight: FontWeight.bold,color: darkMode ? Colors.black : Colors.white),),
                        const Padding(
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
