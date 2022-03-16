import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/resources/resources.dart';

class BurgersButtom extends StatelessWidget {
  const BurgersButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(Images.rectangle18),
          const Text(
            'Big cheese burger',
            style: TextStyle(fontSize: 16.0),
          ),
          const Text(
            'No 10 opp lekki phase 1 bridge \nin sangotedo estate',
            style: TextStyle(fontSize: 12.0),
          ),
          Row(
            children: [
              SvgPicture.asset(Svgs.star1),
              const Text('4+'),
              const SizedBox(width: 100.0),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SvgPicture.asset(
                  Svgs.heart,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
