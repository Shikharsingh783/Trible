import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trible/screens/payment_page.dart';


late Size mq;

class BuyPage extends StatelessWidget {
  const BuyPage({super.key, this.title, this.community, this.service, this.imagePath, this.price, required this.creator});

  final String? title;
  final String? community;
  final String? service;
  final String? imagePath;
  final String? price;
  final String? creator;

  @override
  Widget build(BuildContext context) {

    // final themeProvider = Provider.of<ThemeProvider>(context);
    // bool darkMode = themeProvider.isdarkMode;
    
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color.fromRGBO(30, 37, 40, 1),
      // 
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.only(left:15),
                      child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,size: 30,),
                    )),
      
                    const SizedBox(width: 20),
      
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title??"",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                      Text(community??"",style: const TextStyle(color: Color.fromRGBO(0, 224, 145, 1),fontSize: 20,fontWeight: FontWeight.w300),),
                     
                    ],
                  ),
                ],
              ),
               const Padding(
                 padding: EdgeInsets.only(right: 20),
                 child: Icon(Icons.more_horiz,color: Colors.white,weight:2,),
               )
            ],
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:18,top:10),
                        child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                            Text(service??"",style: const TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w700),),
                         const SizedBox(height: 2,),
                         Text("offered by $creator",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.black),),
                         ],
                        ),
                      ),
                       Padding(
                         padding: const EdgeInsets.all(16.0),
                         child: SizedBox(
                           width: 400,
                           height: 300,
                           child: Image.asset(imagePath??"")),
                       ),
                       Padding(
                         padding: EdgeInsets.only(left:mq.width*.04,top: mq.height*.014),
                         child: Row(
                           children: [
                             const Text("Service Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),),
                             Padding(
                               padding: EdgeInsets.only(left:mq.width*.28),
                               child: RatingBar.builder(
                                initialRating: 2,
                                unratedColor: Colors.grey.shade300,
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
                         padding: EdgeInsets.only(left:mq.width*.07,right: 180),
                         child: const Column(
                           children: [
                             Text("Get a fully functioning end to end ecommerce website that is highly scalable",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.w400),),
                            //  Text("Point 2",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.w400),),
                            //  Text("Point 3",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.w400),),
                            //  Text("Point 4",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.w400),),
                           ],
                         ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left:mq.width*.04,top: mq.height*.015),
              //   child: const Text("Testimonials",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.w500 ),),
              // ),
              const SizedBox(height: 40),
                    ],
                  ),
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
                          child: Text('₹ ${price??''}',style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:mq.width*.37,top:mq.height*.005),
                          child: GestureDetector(
                                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage(imageUrl: imagePath.toString(), service: service.toString(), creator: creator.toString(), price: price.toString(),)));},
                                    child: Container(
                                      height: 51,
                                      width: 136,
                                      decoration: BoxDecoration(color: const Color.fromRGBO(0, 224, 145, 1),borderRadius: BorderRadius.circular(5)),
                                      child: const Center(child: Text("Hire Now",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),)),
                                    ),
                          ),
                        
                              ),
                                                     
                                               ],
                           ),
                ],
              ),
            ),
          ),
         
        ],
      ),

    );
  }
}