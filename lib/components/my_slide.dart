
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';


import 'package:slide_to_act/slide_to_act.dart';
import 'package:url_launcher/url_launcher_string.dart';


class MySlide extends StatefulWidget {
  const MySlide({Key? key});

  @override
  State<MySlide> createState() => _MySlideState();
}


class _MySlideState extends State<MySlide> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: SlideAction(
        animationDuration: const Duration(milliseconds: 600),
        text: "Slide to Pay",
        textStyle: const TextStyle(fontSize: 25,color: Colors.black),
        elevation: 0,
        innerColor: Theme.of(context).colorScheme.primary,
        borderRadius: 15,
        onSubmit: () {
          launchUrlString('https://buy.stripe.com/test_fZe6pXcNbduG1qgbIS');
          // Navigator.pop(context);
        },
       
      ),
    );
  }

//   Future<void> initPaymentSheet() async {
//     try {
//       // 1. create payment intent on the server
//       final data = await _createTestPaymentSheet();

//       // 2. initialize the payment sheet
//      await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           // Set to true for custom flow
//           customFlow: false,
//           // Main params
//           merchantDisplayName: 'Flutter Stripe Store Demo',
//           paymentIntentClientSecret: data['paymentIntent'],
//           // Customer keys
//           customerEphemeralKeySecret: data['ephemeralKey'],
//           customerId: data['customer'],
         
//           style: ThemeMode.dark,
//         ),
//       );
//       setState(() {
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//       rethrow;
//     }
// }


}
