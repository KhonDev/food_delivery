import 'package:flutter/material.dart';
import 'package:food_app/screens/big_boys_cheese_screen.dart';

class ToppinngCard extends StatelessWidget {
  final Topping topping;
  final bool isActive;
  final VoidCallback onPressed;
  const ToppinngCard({
    Key? key,
    required this.topping,
    required this.onPressed,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.0,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 11.0,
            horizontal: 8.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          side: isActive
              ? const BorderSide(
                  color: Color(0xFFF9881F),
                )
              : null,
        ),
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(topping.icon),
              const SizedBox(width: 10.0),
              Text(
                topping.title,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
