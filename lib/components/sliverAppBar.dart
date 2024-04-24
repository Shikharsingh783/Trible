import 'package:flutter/material.dart';

class MySliverAppBar extends StatefulWidget {
  final String communityName;
  const MySliverAppBar({super.key, required this.communityName});

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar> {

  bool isCollapsed = false;
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      actions: const[
        Padding(
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.more_horiz,color: Colors.white,),
      ),],
      expandedHeight: 200,
      // collapsedHeight: 40,
      pinned: true,
      // title: Text(communityName,style:TextStyle(color:  Theme.of(context).colorScheme.secondary,)),

    flexibleSpace: FlexibleSpaceBar(
      background: Container(
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(widget.communityName.toUpperCase(),style:TextStyle(color:  Theme.of(context).colorScheme.secondary)),
      
    ),
    onStretchTrigger: () {
        setState(() {
          isCollapsed = !isCollapsed;
        });
        return Future.value(true);
      },
    );
  }
}