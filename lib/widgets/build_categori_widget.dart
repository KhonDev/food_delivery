import 'package:flutter/material.dart';
import 'package:food_app/providers/orders_provider.dart';
import 'package:provider/src/provider.dart';

class BuildCategoryWidget extends StatelessWidget {
  final VoidCallback onChange;
  final int index;
  const BuildCategoryWidget({
    Key? key,
    required this.onChange,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _selectedTab = context.select((OrdersProvider m) => m.selectedTab);
    return GestureDetector(
      onTap: onChange,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              index == 0 ? 'Complete orders' : 'Pending orders',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _selectedTab == index
                    ? const Color(0xff535353)
                    : const Color(0xffacacac),
              ),
            ),
            if (_selectedTab == index)
              Container(
                margin: const EdgeInsets.only(top: 20.0 / 4),
                height: 2.0,
                width: 60,
                color: Colors.black,
              )
          ],
        ),
      ),
    );
  }
}
