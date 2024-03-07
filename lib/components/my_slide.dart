

import 'package:flutter/material.dart';

import 'package:slide_to_act/slide_to_act.dart';

import 'package:trible/api/stripe_service.dart';

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
        animationDuration: Duration(milliseconds: 600),
        text: "Slide to Pay",
        textStyle: const TextStyle(fontSize: 25),
        elevation: 0,
        innerColor: Theme.of(context).colorScheme.primary,
        borderRadius: 15,
        onSubmit: () async{
          var items = [
            {
              'productPrice': 4,
              'productName': "Web Dev",
              'qty': 1
            }
          ];
          await StripeService.stripePaymentCheckout(items, 4, context, mounted,
          onSuccess: (){
            print("SUCCESS");
          },
          onCancel:(){
            print("Cancel");
          } ,
          onError: (e){
            print("Error"+ e.toString());
          }
          );
        },
      ),
    );
  }

  // Future<void> makePayment()async {
  //   try{
  //     paymentIntentData = await createPaymentIntent('4000','INR');

  //     await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
  //       setupIntentClientSecret: 'sk_test_51MZej1SHW9a46lSl8Y8H0411s5Awkdfo0bL1RtjRfdg5oQ9YvG4DjY6LJDtfC4FVGoSS7lrxFzCJvmOK0d26QfFh005ZscaEVB',
  //       paymentIntentClientSecret: paymentIntentData!['client_secret'],
  //       googlePay: PaymentSheetGooglePay(merchantCountryCode: "IN"),
  //       merchantDisplayName: "Shikhar"
        
  //     )); 

  //     displayPaymentSheet();

  //   }catch(e){
  //     print('exception'+ e.toString());
  //   }
  // }

  // displayPaymentSheet()async{
  //   try{

  //     await Stripe.instance.presentPaymentSheet(
        
        
  //     );
  //     setState(() {
  //       paymentIntentData = null;
  //     });

  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Paid successfully")));

  //   } on StripeException catch(e){
  //     print(e.toString());

  //     showDialog(context: context, builder: (_)=> AlertDialog(content: Text("Cancelled"),));
  //   }
  // }


  // createPaymentIntent(String amount,String currency) async {
  //    try{
  //     Map<String,dynamic> body = {
  //       'amount': calculateAmount(amount),
  //       'currency': currency,
  //       'paymeny_method_types[]': 'card'
  //     };

  //     var response = await http.post(Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //     body: body,

  //     headers: { 'Authorization': "sk_test_51MZej1SHW9a46lSl8Y8H0411s5Awkdfo0bL1RtjRfdg5oQ9YvG4DjY6LJDtfC4FVGoSS7lrxFzCJvmOK0d26QfFh005ZscaEVB",
      
  //       'Content-Type': "application/x-www-form-urlencoded"
  //     },
  //     );

  //     return jsonDecode(response.body.toString());

  //   }catch(e){
  //     print('exception'+ e.toString());
  //   }
  // }
  // calculateAmount(String amount){
  //   final price = int.parse(amount);
  //   return price.toString();
  // }
}
