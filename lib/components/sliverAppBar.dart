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
        child: Icon(Icons.arrow_back_ios_new_rounded,color: Theme.of(context).colorScheme.secondary,)),
      backgroundColor: Theme.of(context).colorScheme.surface,
      actions: [
        Padding(
        padding: const EdgeInsets.only(right: 20),
        child: IconButton(onPressed: widget.onPressed,icon: const Icon(Icons.more_horiz_outlined,color: Colors.white,),)
      ),],
      expandedHeight: 200,
      collapsedHeight: 75,
      pinned: true,
      // floating: true,
      // title: Text(communityName,style:TextStyle(color:  Theme.of(context).colorScheme.secondary,)),

    flexibleSpace: FlexibleSpaceBar(
      background: Container(
        color: Colors.grey.shade900,
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.communityName.toUpperCase(),style:TextStyle(color:  Theme.of(context).colorScheme.secondary,fontSize: 20)),
            Text('hello',style:TextStyle(color:  Theme.of(context).colorScheme.secondary,fontSize: 18)),
          ],
        ),
      ),
      
    ),
    );
  }
}