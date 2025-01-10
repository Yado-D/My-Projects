import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class PaymentPage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {"name": "Apple", "quantity": 4, "price": '10', "currency": "USD"},
    {"name": "Pineapple", "quantity": 5, "price": '12', "currency": "USD"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay with PayPal'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _makePayment(context, items, '100', 'USD'),
          child: Text('Checkout'),
        ),
      ),
    );
  }

  void _makePayment(BuildContext context, List<Map<String, dynamic>> items,
      String total, String currency) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: dotenv.env['PAYPAL_CLIENT_ID'] ?? '',
          secretKey: dotenv.env['PAYPAL_SECRET_KEY'] ?? '',
          transactions: [
            {
              "amount": {
                "total": total,
                "currency": currency,
                "details": {
                  "subtotal": total,
                  "shipping": '0',
                  "shipping_discount": 0
                },
              },
              "description": "The payment transaction description.",
              "item_list": {
                "items": items,
              }
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
            Navigator.pop(context);
          },
          onError: (error) {
            print("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
