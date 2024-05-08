import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceDatabase {
  final CollectionReference community =
      FirebaseFirestore.instance.collection('community');

  // Add services to database
  Future<void> addService(
      String communityId, String domain, String service, String image, String price) async {
    await community.doc(communityId).collection('services').add({
      'domain': domain,
      'service': service,
      'image': image,
      'price': price,
      'TimeStamp': DateTime.now(),
    });
  }

  //delete service
  Future<void> deleteService(String communityId, String serviceId)async{
    await community.doc(communityId).collection('services').doc(serviceId).delete();
  }

  // Get services from database
  Stream<QuerySnapshot> getServiceStream(String communityId) {
    final serviceStream = community
        .doc(communityId)
        .collection("services")
        .orderBy('TimeStamp', descending: true)
        .snapshots();

    return serviceStream;
  }
}