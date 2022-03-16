import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String text;
  final Image image;
  const CategoryButton({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 81.0,
      height: 109.0,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 11.0,
            horizontal: 8.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          side: const BorderSide(
            color: Color(0xFF3EC032),
          ),
        ),
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFA9E88B).withOpacity(0.20),
            borderRadius: BorderRadius.circular(50.0),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              image,
              const SizedBox(height: 5.0),
              Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
