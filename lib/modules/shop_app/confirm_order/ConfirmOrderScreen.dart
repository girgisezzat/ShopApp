import 'package:flutter/material.dart';

class ConfirmOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/order_confirmed.png')),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Your order has been confirmed!, Thanks for purschasing',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 25),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: Theme.of(context).textTheme.bodyText1!
                      .copyWith(fontSize: 20, color: Colors.deepOrange),
                )),
          ],
        ),
      ),
    );
  }
}