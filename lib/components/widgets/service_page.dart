import 'package:flutter/material.dart';

late Size mq;

class ServicePage extends StatelessWidget {  
  final String title1;
  final String community1;
  final String i1;
  final String s1;
  final String? i2;
  final String? s2;
  final String? i3;
  final String? s3;
  final String? i4;
  final String? s4;
  final String? i5;
  final String? s5;
  final String? i6;
  final String? s6;
  void Function()? tap1;
  void Function()? tap2;
  void Function()? tap3;
  void Function()? tap4;
  void Function()? tap5;
  ServicePage({super.key, required this.title1, required this.community1,required this.i1,required this.s1, this.i2, this.s2, this.i3, this.s3, this.i4, this.s4, this.i5, this.s5, this.i6, this.s6, this.tap1,this.tap2,this.tap3,this.tap4,this.tap5});

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
                  onTap:()=> Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,size: 30,)),
              ),
              Padding(
                padding:  EdgeInsets.only(left:mq.width*.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title1,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                    Text(community1,style: const TextStyle(color: Color.fromRGBO(0, 224, 145, 1),fontSize: 20,fontWeight: FontWeight.w300),),
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
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                             boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                        ),
                        width: 500,
                        child: TextField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromRGBO(0, 224, 125, 1)),borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color.fromRGBO(0, 224, 125, 1)),borderRadius: BorderRadius.circular(10)),
                            contentPadding: const EdgeInsets.only(left: 20,),
                            hintText: "Search",
                            hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4),fontSize: 18,fontWeight: FontWeight.w500)
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                 
                   Row(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(left:mq.width*.07),
                         child: GestureDetector(
                          onTap:tap1,
                           child: Container(
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
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                              
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.all(2.0),
                                     child: Image.asset(i1),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(right:5,left: 2),
                                     child: Text(s1,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                                   ),
                                              
                                 ],
                               ),
                             ),
                         ),
                       ),
                      const SizedBox(width: 30,),
                      if(i2 !=null && s2 !=null)
                       GestureDetector(
                        onTap: tap2,
                         child: Container(
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
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             
                                           
                                             children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset(i2!),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:5,left: 2),
                            child: Text(s2!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                          ),
                                           
                                             ],
                                           ),
                                             ),
                       )
                     ],
                   ),
                   const SizedBox(height: 20,),
                    Row(
                     children: [
                       if(i3 !=null && s3 !=null)
                       Padding(
                         padding: EdgeInsets.only(left:mq.width*.07),
                        
                         child: GestureDetector(
                          onTap: tap3,
                           child: Container(
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
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.all(2.0),
                                     child: Image.asset(i3!),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(right:5,left: 2),
                                     child: Text(s3!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                                   ),
                                                
                                 ],
                               ),
                             ),
                         ),
                       ),
                      const SizedBox(width: 30,),
                      if(i4 !=null && s4 !=null)
                       GestureDetector(
                        onTap: tap4,
                         child: Container(
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
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             
                                           
                                             children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset(i4!),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:5,left: 2),
                            child: Text(s4!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                          ),
                                           
                                             ],
                                           ),
                                             ),
                       )
                     ],
                   ),
                   const SizedBox(height: 20,),
                    Row(
                     children: [
                       if(i5 !=null && s5 !=null)
                       Padding(
                         padding: EdgeInsets.only(left:mq.width*.07),
                        
                         child: GestureDetector(
                          onTap: tap5,
                           child: Container(
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
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.all(2.0),
                                     child: Image.asset(i5!),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(right:5,left: 2),
                                     child: Text(s5!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                                   ),
                                                
                                 ],
                               ),
                             ),
                         ),
                       ),
                      const SizedBox(width: 30,),
                      if(i6 !=null && s6 !=null)
                       Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                    
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset(i6!),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:5,left: 2),
                          child: Text(s6!,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),),
                        ),
                    
                      ],
                    ),
                      )
                     ],
                   ),
                  //  Text("hello",style: TextStyle(fontSize: 30),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}