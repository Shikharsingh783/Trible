import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:trible/provider/profile_image.dart';
import 'package:trible/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;
   String? profileImageUrl; // Variable to hold the image URL
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? userName;
  String? userEmail;
  String? userJob;
  String? twitterLink;
  String? githubLink;
  String? linkedinLink;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getCurrentProfile();
  }


  void getCurrentProfile() async {
    User? user = _auth.currentUser;
    if (user != null) {
      // Fetch profile image URL from Firebase Storage
      Reference storageReference = FirebaseStorage.instance.ref().child('profile_images/${user.uid}.jpg');
      String downloadURL = await storageReference.getDownloadURL();

      setState(() {
        profileImageUrl = downloadURL;
      });
    }

    
  }

  void getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
          await _firestore.collection('users').doc(user.uid).get();
      Map<String, dynamic>? data = userData.data() as Map<String, dynamic>?;

      if (data != null && data.isNotEmpty) {
        setState(() {
          userName = data['firstName'] + ' ' + data['lastName'];
          userEmail = user.email;
          userJob = data['service'];
        });
      } else {
        print('User data not found or empty');
      }

      // Fetch profile details
      DocumentSnapshot profileData =
          await _firestore.collection('profileLinks').doc(user.uid).get();
      Map<String, dynamic>? profile = profileData.data() as Map<String, dynamic>?;

      if (profile != null && profile.isNotEmpty) {
        setState(() {
          twitterLink = profile['twitter'];
          githubLink = profile['github'];
          linkedinLink = profile['linkedin'];
        });
      } else {
        print('Profile data not found or empty');
      }
    } else {
      print('User not logged in');
    }
  }

  Future<void> uploadImage() async {
  try {
    // Check if an image is selected
    if (_image != null) {
      User? user = _auth.currentUser;
      if (user != null) {
        // Get a reference to the storage bucket with UID as filename
        Reference storageReference = FirebaseStorage.instance
            .ref()
            .child('profile_images/${user.uid}.jpg');

        // Upload the file to Firebase Storage
        UploadTask uploadTask = storageReference.putData(_image!);

        // Await the completion of the upload task
        await uploadTask.whenComplete(() async {
          // Get the download URL of the uploaded image
          String imageUrl = await storageReference.getDownloadURL();

          // Update the user's profile with the image URL or save it as needed
          // For example, you can save the URL in Firestore
          // FirebaseFirestore.instance.collection('users').doc(user.uid).update({'profileImageUrl': imageUrl});

          // Show a success message or perform any other actions
          print('Image uploaded successfully. URL: $imageUrl');
        });
      } else {
        print('User not logged in');
      }
    } else {
      // Handle case when no image is selected
      print('No image selected');
    }
  } catch (e) {
    // Handle any errors that occur during the upload process
    print('Error uploading image: $e');
  }
}


  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });

    uploadImage();

  }

 

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
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "P  R  O  F  I  L  E",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          leading: GestureDetector(
            onTap: () {
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
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(profileImageUrl!),
                          )
                        : const CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.white,
                          ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              selectImage();
                            },
                            child: FaIcon(
                              FontAwesomeIcons.camera,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _launchURL(twitterLink ?? "");
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
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
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    _launchURL(githubLink ?? "");
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
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
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    _launchURL(linkedinLink ?? "");
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
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
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    Text("N A M E :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    Padding(
                      padding: EdgeInsets.only(left: 55),
                      child: Text('${userName ?? "Loading..."}'.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsetsDirectional.only(start: 25, end: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    const Text("E M A I L :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(left: 48),
                      child: Text(userEmail ?? "", style: const TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    const Text("S E R V I C E :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text('${userJob ?? ""}'.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
                    ),
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
