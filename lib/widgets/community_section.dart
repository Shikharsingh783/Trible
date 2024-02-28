import 'package:flutter/material.dart';

late Size mq;

class Community extends StatelessWidget {
  final String? communiuty;
  final String creator;
  const Community({super.key, this.communiuty, required this.creator});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Container (
      child: Column(
        children: [
          Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:mq.width*.05),
                      child: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,size: 30,),
                    ),
                    SizedBox(width: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(communiuty??"",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                        Text(creator,style: TextStyle(fontSize: 16,fontWeight:FontWeight.w300,color: Colors.white))
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: mq.width*.07),
                      child: Icon(Icons.more_horiz,color: Colors.white,weight: 2,size: 30,),
                    ),
              
                  ],
                ),
                       SizedBox(height: 12,),
                Divider(
                  indent: 0,
                  endIndent: 0,
                  thickness: 1,color: Colors.black,
                ),
        ],
      ),
    );
  }
}