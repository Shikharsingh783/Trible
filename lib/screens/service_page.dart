// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:trible/components/my_drawer.dart';
import 'package:trible/components/sliverAppBar.dart';
import 'package:trible/components/widgets/buy_page.dart';
import 'package:trible/data/community_data.dart';

class ServicePage extends StatefulWidget {
  final String communityName;
  const ServicePage({super.key, required this.communityName});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {

  final newServiceNameController = TextEditingController();
  final newServiceImageController = TextEditingController();
  final newServicePriceController = TextEditingController();
  final newServiceDomainController = TextEditingController();

  void createNewService(){
    showDialog(context: context, builder: (context)=>
    AlertDialog(
      title: const Text("Create New Service"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

           TextField(
            controller: newServiceDomainController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Domain'
            ),
          ),

          const SizedBox(height: 5),


          TextField(
            controller: newServiceNameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Community Name'
            ),
          ),

          const SizedBox(height: 5),

          TextField(
            controller: newServiceImageController,
            decoration: const InputDecoration(
                hintText: 'Image path',
              border: OutlineInputBorder()
            ),
          ),

          const SizedBox(height: 5),

          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: newServicePriceController,
            decoration: const InputDecoration(
                hintText: '₹ Price',
              border: OutlineInputBorder()
            ),
          ),
        ],
      ),
      
      actions: [

        //save button
        MaterialButton(onPressed: save,
        child: const Text("Save"),
        ),

        //cancel button
        MaterialButton(onPressed: cancel,
        child: const Text("Cancel"),
        )
      ],
    )
    );
  }

  void save(){
    Provider.of<CommunityData>(context, listen: false).addServices(widget.communityName, newServiceNameController.text, newServiceImageController.text, newServicePriceController.text, newServiceDomainController.text );


     Navigator.pop(context);
    newServiceNameController.clear();
    newServiceImageController.clear();
    newServiceDomainController.clear();
    newServicePriceController.clear();
  }

  void cancel(){
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
      label: Text(
        'New Service +',
        style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
      ),
    ),
    endDrawer: MyDrawer(),
    body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        MySliverAppBar(
          communityName: widget.communityName,
          onPressed: Scaffold.of(context).openEndDrawer,
        )
      ],
      body: Consumer<CommunityData>(
        builder: (context, value, child) => Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: GridView.builder(
                  itemCount: value.numberOfServicesInCommunity(widget.communityName),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Adjust the number of columns here
                    crossAxisSpacing: 25, // Space between columns
                    mainAxisSpacing: 4.0, // Space between rows
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyPage(
                            service: value.getReleventCommunity(widget.communityName).services[index].title.toUpperCase(),
                            imagePath: value.getReleventCommunity(widget.communityName).services[index].imagePath,
                            community: widget.communityName,
                            price: value.getReleventCommunity(widget.communityName).services[index].price,
                            title: value.getReleventCommunity(widget.communityName).services[index].domain,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.3)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset(value.getReleventCommunity(widget.communityName).services[index].imagePath),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 2),
                            child: Text(
                              value.getReleventCommunity(widget.communityName).services[index].title,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ),
                          RatingBar.builder(
                            unratedColor: Colors.grey.shade300,
                            initialRating: 2,
                            itemSize: 25,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color.fromRGBO(0, 224, 125, 1),
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}