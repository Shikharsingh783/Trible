import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("T  R  I  B  E  S",style: TextStyle(fontWeight: FontWeight.w700,color: Theme.of(context).colorScheme.secondary),),
        automaticallyImplyLeading: false,
        leading: Icon(Icons.arrow_back_ios_new_rounded,color: Theme.of(context).colorScheme.secondary,),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}