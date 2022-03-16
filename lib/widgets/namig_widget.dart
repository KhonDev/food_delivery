import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Naming extends StatelessWidget {
  final String text;
  final String icon;
  final bool isSvg;
  const Naming({
    Key? key,
    required this.text,
    required this.icon,
    this.isSvg = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isSvg ? SvgPicture.asset(icon) : Image.asset(icon),
        const SizedBox(width: 5.0),
        Text(text),
      ],
    );
  }
}
