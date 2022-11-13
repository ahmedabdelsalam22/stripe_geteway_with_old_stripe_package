import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../services/payment.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StripeServices.init();
  }

  void payNow() async {
    //the amount must be transformed to cents
    var response =
        await StripeServices.payNowHandler(amount: '1000', currency: 'USD');
    if (kDebugMode) {
      print('response message ${response.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            payNow();
          },
          child: const Text('pay 1000 \$'),
        ),
      ),
    );
  }
}
