import 'package:cloud_firestore/cloud_firestore.dart';

class communityDatabase{

  final CollectionReference community = FirebaseFirestore.instance.collection('community');

  //add community to database
  Future<void> addCommunity(String community, String creator)async{
    await FirebaseFirestore.instance.collection('community').add({
      'community': community,
      'creator': creator,
      'TimeStamp':DateTime.now()
    });
  }

  //delete community
  Future<void> deleteCommunity(String communityId)async{
    await FirebaseFirestore.instance.collection('community').doc(communityId).delete();
  }

  //get community from database
  Stream<QuerySnapshot> getCommunityStream(){
    final communityStream = FirebaseFirestore.instance.collection("community").orderBy('TimeStamp',descending: true).snapshots();
    return communityStream;
  }
}