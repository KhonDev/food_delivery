import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/screens/payment_screen.dart';

class PayMents extends StatefulWidget {
  const PayMents({
    Key? key,
  }) : super(key: key);

  @override
  State<PayMents> createState() => _PayMentsState();
}

class _PayMentsState extends State<PayMents> {
  int _currentIndex = 0;

  void _changeCurrentIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PaymentScreen(),
            ),
          ),
          child: SvgPicture.asset(Svgs.oplyus),
        ),
        SizedBox(
          width: 58.0,
          height: 60.0,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 4.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              side: _currentIndex == 0
                  ? const BorderSide(
                      color: Color(0xFFF9881F),
                    )
                  : null,
            ),
            onPressed: () => _changeCurrentIndex(0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: SvgPicture.asset(Svgs.mastercard),
            ),
          ),
        ),
        SizedBox(
          width: 58.0,
          height: 60.0,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 4.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              side: _currentIndex == 1
                  ? const BorderSide(
                      color: Color(0xFFF9881F),
                    )
                  : null,
            ),
            onPressed: () => _changeCurrentIndex(1),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Image.asset(Images.paypal),
            ),
          ),
        ),
        SizedBox(
          width: 58.0,
          height: 60.0,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 4.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              side: _currentIndex == 2
                  ? const BorderSide(
                      color: Color(0xFFF9881F),
                    )
                  : null,
            ),
            onPressed: () => _changeCurrentIndex(2),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Image.asset(Images.stripe),
            ),
          ),
        ),
        const SizedBox(
          width: 40.0,
        ),
      ],
    );
  }
}
