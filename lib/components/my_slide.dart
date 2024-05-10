
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:trible/main.dart';
import 'package:trible/models/community.dart';
import 'package:trible/screens/service_page.dart';
import 'package:url_launcher/url_launcher_string.dart';


class MySlide extends StatefulWidget {
  final String community;
  final String creator;
  const MySlide({Key? key, required this.community, required this.creator});

  @override
  State<MySlide> createState() => _MySlideState();
}


class _MySlideState extends State<MySlide> with RouteAware {

@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context) as PageRoute?;
    if (route != null) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

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
          
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ServicePage(communityName: widget.community, creatorName: widget.creator)));
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
 @override
  void didPopNext() {
    // This method is called when the user returns to the app after closing the link
    // Navigate to a different page here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ServicePage(communityName: widget.community, creatorName: widget.creator,)),
    );
  }


}
