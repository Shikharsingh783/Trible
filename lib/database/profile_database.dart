import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileDatabase {
  // Add user details to the database
  Future<void> addUserDetails(String userId, String firstName, String lastName, String service) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(userId).set({
        "firstName": firstName,
        "lastName": lastName,
        "service": service,
      });
      print("User details added successfully");
    } catch (e) {
      print("Error adding user details: $e");
    }
  }

  // Add profile links to the database
  Future<void> addProfileDetails(String userId, String twitter, String github, String linkedin) async {
    try {
      await FirebaseFirestore.instance.collection("profileLinks").doc(userId).set({
        "twitter": twitter,
        "github": github,
        "linkedin": linkedin,
      });
      print("Profile details added successfully");
    } catch (e) {
      print("Error adding profile details: $e");
    }
  }

  // Get user data from the database
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance.collection("users").doc(userId).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data();
      } else {
        print("User document does not exist");
        return null;
      }
    } catch (e) {
      print("Error getting user data: $e");
      return null;
    }
  }

  // Get profile links from the database
  Future<Map<String, dynamic>?> getProfileData(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance.collection("profileLinks").doc(userId).get();
      if (documentSnapshot.exists) {
        return documentSnapshot.data();
      } else {
        print("Profile links document does not exist");
        return null;
      }
    } catch (e) {
      print("Error getting profile data: $e");
      return null;
    }
  }
}
