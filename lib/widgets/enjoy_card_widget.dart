import 'package:flutter/material.dart';
import 'package:food_app/widgets/emjoy_category.dart';

class EnjoyCard extends StatelessWidget {
  final EnjoyCategory enjoy;
  final bool isActive;
  final VoidCallback onPressed;

  const EnjoyCard({
    Key? key,
    required this.enjoy,
    this.isActive = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 81.0,
      height: 109.0,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: Colors.grey.shade200,
            padding: const EdgeInsets.symmetric(
              vertical: 11.0,
              horizontal: 8.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            side: BorderSide(
              color: isActive
                  ? enjoy.borderColor
                  : enjoy.borderColor.withOpacity(.20),
            )),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 10.0,
          ),
          decoration: BoxDecoration(
            color: isActive
                ? enjoy.backgroundColor.withOpacity(.20)
                : enjoy.borderColor.withOpacity(.10),
            borderRadius: BorderRadius.circular(50.0),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                enjoy.icon,
                width: 26.0,
                height: 26.0,
              ),
              Text(
                enjoy.title,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
