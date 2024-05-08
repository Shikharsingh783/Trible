import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Communitytile extends StatelessWidget {
  final String name;
  final String creator;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;
  final void Function()? onPressed;
  Communitytile({super.key, required this.name, required this.creator, this.onPressed,required this.deleteFunction, required this.editFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Container(
        child: Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(),
           children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade400,
              borderRadius: BorderRadius.circular(12),
              
              ),
              SlidableAction(
                onPressed: editFunction,
                icon: Icons.edit,
                backgroundColor: Colors.white,
                borderRadius: BorderRadius.circular(12),
                )
           ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
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
                // const SizedBox(height: 25),
                
                //divider
                // const Divider(
                //       indent: 0,
                //       endIndent: 0,
                //       thickness: 1,color: Colors.black,
                //     ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}