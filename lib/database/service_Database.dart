import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceDatabase{

  final CollectionReference community = FirebaseFirestore.instance.collection('services');

  //add community to database
  Future<void> addCommunity(String community, String creator)async{
    await FirebaseFirestore.instance.collection('services').add({
      'community': community,
      'creator': creator,
      'TimeStamp':DateTime.now()
    });
  }

  //get community from database
  Stream<QuerySnapshot> getCommunityStream(){
    final communityStream = FirebaseFirestore.instance.collection("services").orderBy('TimeStamp',descending: true).snapshots();
    return communityStream;
  }
}