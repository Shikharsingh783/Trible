import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceDatabase{

  final CollectionReference services = FirebaseFirestore.instance.collection('services');

  //add services to database
  Future<void> addService(String domain, String service,String image,String price)async{
    await FirebaseFirestore.instance.collection('services').add({
      'domain': domain,
      'service': service,
      'image': image,
      'price': price,
      'TimeStamp':DateTime.now()
    });
  }

  //get services from database
  Stream<QuerySnapshot> getServiceStream(){
    final serviceStream = FirebaseFirestore.instance.collection("services").orderBy('TimeStamp',descending: true).snapshots();
    return serviceStream;
  }
}