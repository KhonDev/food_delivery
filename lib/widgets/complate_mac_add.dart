import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/theme/app_color.dart';

class ComplateMacBurgerAdd extends StatefulWidget {
  const ComplateMacBurgerAdd({
    Key? key,
  }) : super(key: key);

  @override
  State<ComplateMacBurgerAdd> createState() => _ComplateMacBurgerAddState();
}

class _ComplateMacBurgerAddState extends State<ComplateMacBurgerAdd> {
  int _counter = 1;

  void _counterPlyus() {
    setState(() {
      _counter++;
    });
  }

  void _counterMinus() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 112.0,
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          elevation: .5,
          child: Stack(
            children: [
              Positioned(
                top: -10,
                right: -10,
                child: SvgPicture.asset(Svgs.group453),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppColors.backround,
                      elevation: .5,
                      child: Image.asset(
                        Images.burgerbig,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'The Macdonalds',
                        style: TextStyle(),
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        'Classic cheesburger',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        '23.99',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: _counterMinus,
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: SvgPicture.asset(Svgs.minus),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: AppColors.buttonColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              '$_counter',
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(width: 5.0),
                            GestureDetector(
                              onTap: _counterPlyus,
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: SvgPicture.asset(Svgs.plyus),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: AppColors.buttonColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Order again',
                        style: TextStyle(
                            color: AppColors.skipColor,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
