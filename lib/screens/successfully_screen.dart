import 'package:flutter/material.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/widgets/custom_button_widget.dart';

class SuccessfullyScreen extends StatelessWidget {
  const SuccessfullyScreen({Key? key}) : super(key: key);

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
            const Spacer(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(Images.yeskanse),
                  const Text(
                    'Your order has been\nsuccessfully placed',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Sit and relax while your orders is being\nworked on . It’ll take 5min before you get it',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButtonWidget(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                ),
                title: 'Go back to home',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
