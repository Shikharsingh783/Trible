import 'package:flutter/material.dart';

class Communitytile extends StatelessWidget {
  final String name;
  final String creator;
  final void Function()? onPressed;
  const Communitytile({super.key, required this.name, required this.creator, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 20,top: 5,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(name,style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 20,fontWeight: FontWeight.w500),),
                Text(creator,style:TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 16,fontWeight: FontWeight.w300),),
              ],),

              //icon
             IconButton(onPressed: onPressed, icon: Icon(Icons.keyboard_arrow_right_sharp,color: Theme.of(context).colorScheme.secondary,size: 35,))
            ],),
          ),

          //divider
          const Divider(
                indent: 0,
                endIndent: 0,
                thickness: 1,color: Colors.black,
              ),
        ],
      ),
    );
  }
}