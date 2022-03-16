import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/providers/orders_provider.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/theme/app_color.dart';
import 'package:food_app/widgets/categories_widget.dart';
import 'package:food_app/widgets/complate_mac_add.dart';
import 'package:provider/provider.dart';

class YourOrdersScreen extends StatelessWidget {
  const YourOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _selectedTab = context.select((OrdersProvider m) => m.selectedTab);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(
                  child: Text(''),
                ),
              ],
            ),
            const Text(
              'Your orders',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Categories(),
            // const ComplateMacBurgerAdd(),
            // const SizedBox(height: 20.0),
            // const ComplateMacBurgerAdd(),
            // const SizedBox(height: 20.0),
            // const ComplateMacBurgerAdd(),
            Expanded(
              child: _selectedTab == 0
                  ? ListView.separated(
                      itemCount: 5,
                      itemBuilder: (context, index) =>
                          const ComplateMacBurgerAdd(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20.0),
                    )
                  : Column(
                      children: [
                        MacPendingWidget(),
                        MacPendingWidget(),
                        MacPendingWidget(),
                        MacPendingWidget(),
                        MacPendingWidget(),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class MacPendingWidget extends StatelessWidget {
  const MacPendingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 120.0,
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.backround,
            elevation: .5,
            child: Image.asset(
              Images.burgerbig,
            ),
          ),
        ),
        const SizedBox(height: 90.0, width: 10.0),
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
      ],
    );
  }
}
