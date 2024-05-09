// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trible/components/my_drawer.dart';
import 'package:trible/components/sliverAppBar.dart';
import 'package:trible/components/widgets/buy_page.dart';
import 'package:trible/database/service_Database.dart';

class ServicePage extends StatefulWidget {
  final String communityName;

  ServicePage({Key? key, required this.communityName}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final ServiceDatabase db = ServiceDatabase();

  final newServiceNameController = TextEditingController();
  final newServiceImageController = TextEditingController();
  final newServicePriceController = TextEditingController();
  final newServiceDomainController = TextEditingController();

  void createNewService() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Create New Service"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newServiceDomainController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Domain',
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: newServiceNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Community Name',
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: newServiceImageController,
              decoration: const InputDecoration(
                hintText: 'Image path',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: newServicePriceController,
              decoration: const InputDecoration(
                hintText: '₹ Price',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          //save button
          MaterialButton(
            onPressed: save,
            child: const Text("Save"),
          ),
          //cancel button
          MaterialButton(
            onPressed: cancel,
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void save() {
    db.addService(
      widget.communityName,
      newServiceDomainController.text,
      newServiceNameController.text,
      newServiceImageController.text,
      newServicePriceController.text,
    );

    Navigator.pop(context);
    newServiceNameController.clear();
    newServiceImageController.clear();
    newServiceDomainController.clear();
    newServicePriceController.clear();
  }

  void cancel() {
    Navigator.pop(context);
    newServiceNameController.clear();
    newServiceImageController.clear();
    newServiceDomainController.clear();
    newServicePriceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: createNewService,
        label: const Text(
          'New Service +',
          style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
      endDrawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            communityName: widget.communityName,
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ],
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(0, 224, 125, 1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(0, 224, 125, 1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.only(left: 20),
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            StreamBuilder(
              stream: db.getServiceStream(widget.communityName),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final services = snapshot.data!.docs;

                if (snapshot.data == null || services.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Text(
                        "No service, create one",
                        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: GridView.builder(
                      itemCount: services.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {

                         DocumentSnapshot document = snapshot.data!.docs[index];
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;

              String serviceId = document.id; 
              
                        final serv = services[index];
                        String dom = serv['domain'];
                        String img = serv['image'];
                        String pri = serv['price'];
                        String name = serv['service'];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuyPage(
                                  service: name.toUpperCase(),
                                  imagePath: img,
                                  community: widget.communityName,
                                  price: pri,
                                  title: dom,
                                ),
                              ),
                            );
                          },

onLongPress: () {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('You want to remove the service?'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.warning_amber,color: Colors.white24),

                SizedBox(width: 15,),

                Expanded(
                  child: Text(
                    'Deleting service will permanently delete it from the database.',
                    style: TextStyle(fontSize: 16,color: Colors.white24),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => db.deleteService(widget.communityName, serviceId),
                  child: Text("Sure"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
},

                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow:  [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.3)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Image.asset(img),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 28, left: 5),
                                      child: Text(
                                        name,
                                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: RatingBar.builder(
                                    unratedColor: Colors.grey.shade300,
                                    initialRating: 2,
                                    itemSize: 22,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Color.fromRGBO(0, 224, 125, 1),
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}