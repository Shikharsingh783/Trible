import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trible/components/my_drawer.dart';
import 'package:trible/widgets/buy_page.dart';
import 'package:trible/widgets/community_section.dart';
import 'package:trible/widgets/service_page.dart';

class home extends StatelessWidget {
  home({Key? key});
  final user  = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    // //  actions: [
    // //       Padding(
    // //         padding: const EdgeInsets.only(right: 19.0,top: 30
    // //         ),
    // //         child: IconButton(
    // //           icon: Icon(Icons.menu),
    // //           onPressed: () {
    // //             Scaffold.of(context).openEndDrawer();
    // //           },
    // //         ),
    // //       )
    // //     ],
        
    //   ),
    
      endDrawer: MyDrawer(),
      body: Stack(
        children: [SingleChildScrollView(
          child: Padding(
         padding: const EdgeInsets.only(top: 110),
            child: Column(
              children: [        
                Padding(
                  padding: EdgeInsets.only(left: mq.width * 0.1),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tribes",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 28,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Your Communities",
                            style: TextStyle(
                                color:Theme.of(context).colorScheme.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Builder(
                        builder: (BuildContext context) {
                           return Padding(
                             padding: const EdgeInsets.only(left:140),
                             child: IconButton( onPressed: () {
                                          Scaffold.of(context).openEndDrawer();
                                        }, icon: Icon(Icons.more_horiz_rounded,color: Colors.white,size: 35,)),
                           );
                        }),
                       
                      
                      
                      //  IconButton(
                      //              onPressed: () async {
                      //                await FirebaseAuth.instance.signOut();
                      //                print("log out");
                      //                 ScaffoldMessenger.of(context).showSnackBar(
                      //                  SnackBar(
                      //   content: Text("Logged out successfully!",style: TextStyle(color: Colors.black),),
                      //   backgroundColor: Colors.red,
                      //                  ),
                      //                );
                      //                Navigator.of(context).pushReplacement(
                      //                  MaterialPageRoute(builder: (context) => signin()),
                      //                );
                      //              },
                      //              icon: Icon(
                      //                Icons.logout,
                      //                color: Colors.red,
                      //              ),
                      //            ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                 const Divider(
                  indent: 0,
                  endIndent: 0,
                  thickness: 1,color: Colors.white,
                ),
                const SizedBox(height: 10,),
                const Community(communiuty: "School Community", creator: "@randomschool123"),
                const Community(communiuty: "Hostel Community", creator: "@hostelblock24"),
                Community(communiuty: "Office Space", creator: "@randomoffice123"),
                Community(communiuty: "Friend Circle", creator: "@randomfriend123"),
                Community(communiuty: "Random Community", creator: "@random"),
                
               
                // Padding(
                //   padding: EdgeInsets.only(left:mq.width*.12,top:mq.height*.7),
                //   child: Row(
                //     children: [
                //       Text("Logged in as  ::  ",style: TextStyle(color: Colors.white,fontSize: 18),),
                //       Text(
                //         user?.email ?? "No user email",
                //         style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),
                //       ),
                //     ],
                //   ),
                // ),
                      
              
              ],
            ),
          ),
        ),
         GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ServicePage(title1: 'Website development', community1: 'School Community',
                i1: "images/s1.png",s1: "Responsive web design",tap1:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> BuyPage(title: "Website Development",community: "School Community",service: "Responsive Web Design",imagePath: "images/s1.png",price: "Rs. 4000",)));},
      
                i2: "images/s2.png",s2: "Full Stack WebDev",tap2: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> BuyPage(title: "Website Development",community: "School Community",service: "Full Stack WebDev",imagePath: "images/s2.png",price: "Rs. 8000",)));
                },
                i3: "images/s3.png",s3: "SEO Service",tap3: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyPage(title: "Website Development",community: "School Community",service: "SEO Service",imagePath: "images/s2.png",price: "Rs. 5000")));
                },       
                i4: "images/s1.png",s4: "Front End Development",
                i5: "images/s2.png",s5: "Database Management", 
                ),
              ));
            },
             child: Align(
              alignment: Alignment.bottomRight,
               child: Padding(
                 padding: const EdgeInsets.only(bottom:55,right:25),
                 child: Container(
                  
                  height: 61,
                  width: 155,
                  decoration:BoxDecoration(color: Theme.of(context).colorScheme.primary,borderRadius: BorderRadius.circular(5),),
                  child: Center(child: Text("New Tribe +",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,fontSize: 20,fontWeight: FontWeight.w500),)),
                 ),
               ),
             ),
           )
        ],
      ),
    );
  }
}

