import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String service;
  const ServiceCard({super.key, required this.imagePath, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(3),bottomRight: Radius.circular(3)),
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.3))),
      width: 169,
      height: 202,
      child: Column(
        

        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(imagePath),
          ),
          Padding(
            padding: const EdgeInsets.only(right:5,left: 2),
            child: Text(service,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
          ),

        ],
      ),
    );
  }
}