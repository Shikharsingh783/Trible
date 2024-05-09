import 'package:flutter/material.dart';
import 'package:trible/components/my_slide.dart';

class PaymentPage extends StatelessWidget {
  final String imageUrl;
  final String service;
  final String creator;
  final String price;

  const PaymentPage({Key? key, required this.imageUrl, required this.service, required this.creator, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "T R I B E S",
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
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              // height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Image.asset(imageUrl),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22, color: Colors.black),
                          overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                          maxLines: 2, // Limit to 2 lines
                        ),
                        Text(
                          "Offered by $creator",
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          "₹ $price",
                          style: const TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
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
          ),
        ],
      ),
    );
  }
}
