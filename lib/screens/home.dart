// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trible/components/my_community_tile.dart';
import 'package:trible/components/my_drawer.dart';
import 'package:trible/data/community_data.dart';
import 'package:trible/screens/service_page.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final newCommunityNameController = TextEditingController();
  final newCommunityCreatorController = TextEditingController();

  void goToServicePage(String communityname){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicePage(communityName: communityname,)));
  }

 void createNewCommunity(){
    showDialog(context: context, builder: (context)=>
    AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const Text("Create New Community",style: TextStyle(color: Colors.white),),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Community name cannot be empty';
                }
                return null;
              },
              controller: newCommunityNameController,
              decoration: const InputDecoration(
                 errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
                errorStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintText: 'Community Name',
                hintStyle: TextStyle(color: Colors.white)
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Creator name cannot be empty';
                }
                return null;
              },
              controller: newCommunityCreatorController,
              decoration: const InputDecoration(
                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
                errorStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(),
                  hintText: 'Creator Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                hintStyle: TextStyle(color: Colors.white)
              ),
            ),
          ],
        ),
      ),
      
      actions: [

        //save button
        MaterialButton(onPressed: (){
          if(_formKey.currentState!.validate()){
            save();
          }
        },
        child: const Text("Save",style: TextStyle(color: Colors.white),),
        ),

        //cancel button
        MaterialButton(onPressed: cancel,
        child: const Text("Cancel",style: TextStyle(color: Colors.white),),
        )
      ],
    )
    );
  }

  void save(){
    String newCommunityName = newCommunityNameController.text;
    String newCommunityCreator = newCommunityCreatorController.text;
    Provider.of<CommunityData>(context, listen: false).addCommunity(newCommunityName, newCommunityCreator);

     Navigator.pop(context);
  }

  void cancel(){
    Navigator.pop(context);
    newCommunityNameController.clear();
    newCommunityCreatorController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      endDrawer: MyDrawer(),

      //floating action button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: createNewCommunity,
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('New Tribe +',
          style: TextStyle(
            color: Colors.black,fontSize: 20,
            fontWeight: FontWeight.w500)
            ,),
        ),),
      ),


      body: Consumer<CommunityData>(
      builder: (context, value, child)=>
      SafeArea(
       child: Column(
        children: [
        Padding(
          padding: const EdgeInsets.only(top: 30,left: 30,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tribes',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: Theme.of(context).colorScheme.primary),),
                  Text('Your Communities',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Theme.of(context).colorScheme.secondary),)
                ],
              ),

              //to display drawer on rigth side
              Builder(
                        builder: (BuildContext context) {
                           return Padding(
                             padding: const EdgeInsets.only(left:140),
                             child: IconButton( onPressed: () {
                                          Scaffold.of(context).openEndDrawer();
                                        }, icon: Icon(Icons.more_horiz_rounded,color: Theme.of(context).colorScheme.secondary,size: 35,)),
                           );
                        }),


            ],
          ),
        ),


         const SizedBox(height: 20),


                 const Divider(
                  indent: 0,
                  endIndent: 0,
                  thickness: 1,color: Colors.white,
                ),

                const SizedBox(height: 10,),

                //to display the communities created
                Expanded(
                  child: ListView.builder(
                    itemCount: value.getCommunityList().length,
                    itemBuilder: (context, index){
                  return Communitytile(
                    name: value.getCommunityList()[index].name,
                     creator: value.getCommunityList()[index].creator,
                     onPressed:()=> goToServicePage(value.getCommunityList()[index].name),
                     );
                }))


       ],),
      )
      ,
    ),
    );
  }
}