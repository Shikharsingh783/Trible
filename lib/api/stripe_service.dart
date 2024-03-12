// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:stripe_checkout/stripe_checkout.dart';

// class StripeService{
//   static String secretKey = 'sk_test_51MZej1SHW9a46lSl8Y8H0411s5Awkdfo0bL1RtjRfdg5oQ9YvG4DjY6LJDtfC4FVGoSS7lrxFzCJvmOK0d26QfFh005ZscaEVB';
//   static String publishableKey = 'pk_test_51MZej1SHW9a46lSlS36AI09ccrlQmQWk4cNs3OmMJM7v1ti0hDM7eBWbZLB7SGPfwNprRaUQUBcJC0Q5ljY2FcCJ005gW6cNdQ';

//   static Future<dynamic> createCheckoutSession(
//     List<dynamic> productItems,
//     totalAmount
//   )async{
//     final url = Uri.parse("https://api.stripe.com/v1/checkout/sessions");

//     String lineItems = "";
//     int index = 0;

//     productItems.forEach((val) {
//       var productPrice = (val['productPrice']*100).round().toString();

//       lineItems += "&ine_tems[$index][price_data][product_data][name]=${val['productName']}";
//       lineItems += "&ine_tems[$index][price_data][unit_amount]=$productPrice";
//       lineItems += "&ine_tems[$index][price_data][currency]=EUR";
//       lineItems += "&ine_tems[$index][quantity]=${val['qty'].toString()}";

//       index++;
//      });

//      final response = await http.post(
//       url,
//       body: 'success_url=https://checkout.stripe.dev/success&mode=payment$lineItems',
//       headers:{
//        'Authorization': 'Bearer $secretKey'
//       }
//      );
//      return json.decode(response.body)["id"];
//   }
//   static Future<dynamic> stripePaymentCheckout(
//     productItems,
//     subtotal,
//     context,
//     mounted,{
//       onSuccess,
//       onCancel,
//       onError
//     })async{
//       final String sessionId = await createCheckoutSession(productItems, subtotal);

//       final result = await redirectToCheckout(context:context,sessionId:sessionId, publishableKey: publishableKey,
//       successUrl: 'https://checkout.stripe.dev/success',
//       canceledUrl: 'https://checkout.stripe.dev/cancel'
//       );

//       if(mounted){
//         final text = result.when(redirected: ()=> 'Redirected successfully', success:()=> onSuccess(), canceled: ()=>onCancel(), error: (e)=> onError(e)
//         );
//         return text;
//       }
//     }
// }