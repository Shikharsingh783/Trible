import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Future<void> _launchURL(String url) async {
  if (!await canLaunch(url)) {
    throw 'Cannot launch url';
  }
  await launch(url);
}

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
          automaticallyImplyLeading: false, // Disable default leading icon
          title: const Text("P R O F I L E"),
          leading: GestureDetector(
            onTap: () {
              // Handle leading icon tap here
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.user,
                      size: 80,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _launchURL("https://twitter.com/Shikhar54745760");
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      ClipOval(
                        child: Image.asset(
                          "images/Twitter X.png",
                          fit: BoxFit.cover,
                          height: 42,
                          width: 42,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://github.com/Shikharsingh783');
                    },
                    child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      ClipOval(
                        child: Image.asset(
                          "images/git.png",
                          fit: BoxFit.cover,
                          height: 52,
                          width: 52,
                        ),
                      ),
                    
                    
                    ],
                                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      _launchURL("https://www.linkedin.com/in/shikhar-singh1/");
                    },
                    child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      ClipOval(
                        child: Image.asset(
                          "images/LinkedIn.png",
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                        ),
                      ),
                      SizedBox(width: 10,),
                      
                    ],
                                    ),
                  ),

              ],
            ),
            SizedBox(height: 30,),
            Container(
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
                            Text("N A M E :",style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
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
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("E M A I L :",style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
