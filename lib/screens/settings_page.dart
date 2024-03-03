import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trible/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("S E T T I N G S"),
      ),
      body: Column(
        children: [
           Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsetsDirectional.all(25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12)
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
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsetsDirectional.only(start: 25,end: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12)
            ),
            child:Consumer<ThemeProvider>(
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
        ],
      ),
    );
  }
}