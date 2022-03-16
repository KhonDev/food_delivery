import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:food_app/resources/resources.dart';

class AppBarWithIcon extends StatelessWidget {
  final IconButton icon;

  const AppBarWithIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: icon,
          onPressed: () => ZoomDrawer.of(context)?.toggle(),
        ),
        GestureDetector(
          child: Column(
            children: const [
              Text(
                'Delivery to  ',
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.underline),
              ),
              Text(
                'lekki phase 1, Estate',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              padding: EdgeInsets.zero,
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onPressed: () {},
            child: Image.asset(Images.bashara),
          ),
        ),
      ],
    );
  }
}
