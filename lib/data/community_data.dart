import 'package:flutter/material.dart';
import 'package:trible/models/community.dart';
import 'package:trible/models/service.dart';

class CommunityData extends ChangeNotifier{

  List<Community> communityList = [
    //default community
    Community(name: 'School Community', creator: '@random123', services: [
      Service(imagePath: 'images/s1.png', title: 'responsive web design', price: '4000', domain: 'Website Development',),
      
      Service(imagePath: 'images/s1.png', title: 'responsive web design', price: '4000', domain: 'Website Development',),


    ]),

    Community(name: 'Office Community', creator: '@ramdom123', services: [
      Service(imagePath: 'images/s2.png', title: 'UI', price: '3990', domain: 'App Development'),

      Service(imagePath: 'images/s2.png', title: 'UI', price: '3990', domain: 'App Development'),

      Service(imagePath: 'images/s2.png', title: 'UI', price: '3990', domain: 'App Development')
    ])
    
  ];

  //get the list of community
  List<Community> getCommunityList(){
    return communityList;
  }

  //add a community
  void addCommunity(String name, String creator){
    communityList.add(Community(name: name, creator: creator, services: []));

    notifyListeners();
  }

  //add service to a community
  void addServices(String communityName, String serviceName, String imagePath, String price, String domain){

    //find relevant community
    Community relevantCommunity = communityList.firstWhere((Community)=> Community.name == communityName);

    relevantCommunity.services.add(Service(imagePath: imagePath, title: serviceName, price: price, domain: domain, ));

    notifyListeners();
  }

  int numberOfServicesInCommunity(String communityName){

    Community releventCommunity = getReleventCommunity(communityName);
    return releventCommunity.services.length;
  }

  Community getReleventCommunity(String communityName){
    Community relevantCommunity = communityList.firstWhere((Community)=> Community.name == communityName);

    return relevantCommunity;
  }

}