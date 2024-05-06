import 'package:flutter/material.dart';

class MySliverAppBar extends StatefulWidget {
  final String communityName;
  final VoidCallback? onPressed;
  const MySliverAppBar({super.key, required this.communityName, this.onPressed, });

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {

  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back_ios_new_rounded,color:  Colors.black,)),
      backgroundColor: Colors.white,
      actions: [
        Padding(
        padding: const EdgeInsets.only(right: 20),
        child: IconButton(onPressed: widget.onPressed,icon: const Icon(Icons.more_horiz_outlined,color:  Colors.black,),)
      ),],
      expandedHeight: 120,
      // collapsedHeight: 75,
      pinned: true,

    flexibleSpace: FlexibleSpaceBar(
      background: Container(
        color: Colors.white,
      ),
      title: Text(widget.communityName.toUpperCase(),style:const TextStyle(color:  Colors.black,fontSize: 20)),

      
      
    ),
    );
  }
}