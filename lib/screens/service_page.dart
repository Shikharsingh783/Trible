// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:trible/components/my_drawer.dart';
import 'package:trible/components/sliverAppBar.dart';
import 'package:trible/data/community_data.dart';

class ServicePage extends StatefulWidget {
  final String communityName;
  const ServicePage({super.key, required this.communityName});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      body: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled)=>
      [
        MySliverAppBar(communityName: widget.communityName,)
      ]



      , body: Consumer<CommunityData>(builder: (context, value, child)=>
      Column(children: [

                        Builder(
                        builder: (BuildContext context) {
                           return Padding(
                             padding: const EdgeInsets.only(left:140),
                             child: IconButton( onPressed: () {
                                          Scaffold.of(context).openEndDrawer();
                                        }, icon: Icon(Icons.more_horiz_rounded,color: Theme.of(context).colorScheme.secondary,size: 35,)),
                           );
                        }),

                        Expanded(
                          child: ListView.builder(
                            itemCount: value.getCommunityList().length,
                            itemBuilder: (context, index)=>
                          Container(
                                        width: 190,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                         boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3), // changes position of shadow
                                      ),
                                          ],
                                          borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.3))),
                                      
                                      
                                           
                                          child:Column(   
                                            children: [
                                          
                                              Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: Image.asset(value.getReleventCommunity(widget.communityName).services[index].imagePath,),
                                            ),
                                             
                                              Padding(
                                                padding: const EdgeInsets.only(right:5,left: 2),
                                                child: Text(value.getReleventCommunity(widget.communityName).services[index].title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
                                              ),
                                          
                                              RatingBar.builder(
                                        itemSize: 25,
                                        itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(0, 224, 125, 1),
                                      ), onRatingUpdate: (rating) {
                                      
                                      },),
                                          
                                            ],
                                          ),
                                       
                                          )
                          ),
                        )
      ],)
      )
      ),
    );
  }
}