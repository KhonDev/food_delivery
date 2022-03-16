import 'package:flutter/material.dart';
import 'package:food_app/screens/your_orders_screen.dart';
import 'package:food_app/widgets/app_bar_with_icon.dart';
import 'package:food_app/widgets/custom_button_widget.dart';
import 'package:food_app/widgets/mac_burger_add_widget.dart';

class YourCartScreen extends StatelessWidget {
  const YourCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBarWithIcon(
              icon: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 21.0),
              child: Text(
                'Your Cart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            const MacBurgerAddWidget(),
            const MacBurgerAddWidget(),
            const MacBurgerAddWidget(),
            const SizedBox(height: 80.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 44.0),
                  child: Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 51.0),
                  child: Text(
                    '345',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 27.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButtonWidget(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const YourOrdersScreen(),
                  ),
                ),
                title: 'Process to payment',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
