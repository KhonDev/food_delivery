import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomButtonWidget({
    Key? key,
    required this.onPressed,
    this.title = 'Create account',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 51.0,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(title),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xffF9881F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
