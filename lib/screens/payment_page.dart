import 'package:flutter/material.dart';
import 'package:trible/components/my_slide.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "T  R  I  B  E  S",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Text("Website Development",style: TextStyle(fontSize: 25,color: Theme.of(context).colorScheme.secondary),),

          const SizedBox(height: 50,),
          
          Padding(
            padding: const EdgeInsets.only(left:10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left:12),
                    child: Image.asset("images/s3.png"),
                  )),
                  SizedBox(width:30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SEO Service",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22,color: Theme.of(context).colorScheme.secondary),),
                      Text("Offered by John Doe",style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.secondary),),

                      Text("Rs. 4000",style: TextStyle(color: Theme.of(context).colorScheme.secondary))
                    ],
                  )
              ],
            ),
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 70),
                  child: MySlide(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
