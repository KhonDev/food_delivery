import 'package:flutter/material.dart';

import 'package:food_app/screens/login_to_you_acc_screen.dart';

class LoginButtonWidget extends StatelessWidget {
  final String text;
  const LoginButtonWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginToYourAccount(),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xffFE554A),
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
