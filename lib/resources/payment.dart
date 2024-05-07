import 'dart:convert';

import 'package:http/http.dart' as http;

Future createPaymentintenet({
  required String address,
  required String name,
  required String pin,
  required String city,
  required String state,
  required String country,
  required String currency,
  required String amount,
}) async{

  final url = Uri.parse('https://api.stripe.com/v1/payment_intents');

  final secretKey = 'sk_test_51MZej1SHW9a46lSl8Y8H0411s5Awkdfo0bL1RtjRfdg5oQ9YvG4DjY6LJDtfC4FVGoSS7lrxFzCJvmOK0d26QfFh005ZscaEVB';

  final body =  {
    

    ' amount': amount,
    'currency': currency.toLowerCase,
    ' automatic_payment_methods [enabled]': 'true',
    'description': "Test Donation",
    'shipping [name]': name,
    ' shipping[address][Line1]': address, 
    'shipping[address][postal_code]': pin,
    'shipping[address][city]': city,
    'shipping[address][state]': state,
    'shipping[address][country]': country
    
  };

  final response = await http.post(url,
  headers: {
    'Authorization' : 'Beared $secretKey',
    'content-Type'  : 'application/x-www-form-urlencoded'
  },

  body: body
  );

  if(response.statusCode == 200){
    var json = jsonDecode(response.body);
    print(json);
    return json;
  }else{
    print('erroe in calling intent');
  }
}


