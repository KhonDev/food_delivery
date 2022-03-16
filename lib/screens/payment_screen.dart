import 'package:flutter/material.dart';
import 'package:food_app/screens/successfully_screen.dart';
import 'package:food_app/widgets/custom_button_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () => Navigator.pop(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.0),
                    child: Text(
                      'Payment',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DMSans'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0, left: 20.0),
                    child: Text(
                      'Card details',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      hintStyle: TextStyle(fontSize: 12.0),
                      hintText: '  Enter card details',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10.0, left: 12.0),
                            child: Text('Exp date',
                                style: TextStyle(fontSize: 12.0)),
                          ),
                          SizedBox(
                            height: 76.0,
                            width: 157.0,
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true,
                                hintStyle: TextStyle(fontSize: 12.0),
                                hintText: '  DD/MM',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10.0, left: 12.0),
                            child: Text(
                              'CVV',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ),
                          SizedBox(
                            height: 76.0,
                            width: 157.0,
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true,
                                hintStyle: TextStyle(fontSize: 12.0),
                                hintText: '  Enter CVV',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButtonWidget(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessfullyScreen(),
                  ),
                ),
                title: 'Pay now',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
