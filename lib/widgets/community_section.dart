import 'package:flutter/material.dart';

late Size mq;

class Community extends StatefulWidget {
  final String? communiuty;
  final String creator;
  const Community({super.key, this.communiuty, required this.creator});

  @override
  State<Community> createState() => _CommunityState();
}

final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
];
 String? selectedValue;

class _CommunityState extends State<Community> {
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
                        Text(widget.communiuty??"",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color:Theme.of(context).colorScheme.secondary),),
                        Text(widget.creator,style: TextStyle(fontSize: 16,fontWeight:FontWeight.w300,color: Theme.of(context).colorScheme.secondary))
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: mq.width*.07),
                      child: Icon(Icons.more_horiz,color: Theme.of(context).colorScheme.secondary,weight: 2,size: 30,),
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