import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trible/screens/payment_page.dart';

late Size mq;

class BuyPage extends StatelessWidget {
  const BuyPage({super.key, this.title, this.community, this.service, this.imagePath, this.price});

  final String? title;
  final String? community;
  final String? service;
  final String? imagePath;
  final String? price;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 37, 40, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left:mq.width*0.03),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,size: 30,)),
              ),
              Padding(
                padding:  EdgeInsets.only(left:mq.width*.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title??"",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                    Text(community??"",style: const TextStyle(color: Color.fromRGBO(0, 224, 145, 1),fontSize: 20,fontWeight: FontWeight.w300),),
                   
                  ],
                ),
              ),
               Padding(
                 padding: EdgeInsets.only(left:mq.width*.12),
                 child: const Icon(Icons.more_horiz,color: Colors.white,weight:2,),
               )
            ],
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                 Align(
                  alignment: Alignment.centerLeft,
                   child: Padding(
                     padding: const EdgeInsets.only(left:18,top:20),
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(service??"",style: const TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w700),),
                      const SizedBox(height: 2,),
                      const Text("offered by Jane Doe",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.black),),
                      ],
                     ),
                   ),
                 ),
                  SizedBox(
                    width: 400,
                    height: 300,
                    child: Image.asset(imagePath??"")),
                  Padding(
                    padding: EdgeInsets.only(left:mq.width*.04,top: mq.height*.014),
                    child: Row(
                      children: [
                        const Text("Service Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                        Padding(
                          padding: EdgeInsets.only(left:mq.width*.28),
                          child: RatingBar.builder(
                            itemSize: 25,
                            itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Theme.of(context).colorScheme.primary
                          ), onRatingUpdate: (rating) {
                          
                          },),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.only(right:mq.width*.76),
                    child: const Column(
                      children: [
                        Text("Point 1",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.w400),),
                        Text("Point 2",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.w400),),
                        Text("Point 3",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.w400),),
                        Text("Point 4",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.w400),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right:mq.width*.63,top: mq.height*.015),
                    child: const Text("Testimonials",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500 ),),
                  ),
                  const SizedBox(height: 40),
                   const Divider(
              indent: 0,
              endIndent: 0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:mq.width*.04),
                  child: Text(price??"",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                ),
                Padding(
                  padding: EdgeInsets.only(left:mq.width*.32,top:mq.height*.01),
                  child: GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage()));},
                    child: Container(
                      height: 51,
                      width: 136,
                      decoration: BoxDecoration(color: const Color.fromRGBO(0, 224, 145, 1),borderRadius: BorderRadius.circular(5)),
                      child: const Center(child: Text("Hire",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
                    ),
                  ),
                
                ),

              ],
            )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}