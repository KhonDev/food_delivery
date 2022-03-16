import 'package:flutter/material.dart';
import 'package:food_app/providers/orders_provider.dart';
import 'package:food_app/widgets/build_categori_widget.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _read = context.read<OrdersProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36.0),
      child: SizedBox(
        height: 25.0,
        child: Row(
          children: <Widget>[
            BuildCategoryWidget(
              onChange: () => _read.changeSelectedTab(0),
              index: 0,
            ),
            BuildCategoryWidget(
              onChange: () => _read.changeSelectedTab(1),
              index: 1,
            ),
          ],
        ),
      ),
    );
  }
}
