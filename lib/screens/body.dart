import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/screens/big_boys_cheese_screen.dart';
import 'package:food_app/widgets/app_bar_with_icon.dart';
import 'package:food_app/widgets/burgers_bottom_widget.dart';
import 'package:food_app/widgets/emjoy_category.dart';
import 'package:food_app/widgets/enjoy_card_widget.dart';

class Body extends StatefulWidget {
  final ZoomDrawerController z;
  final VoidCallback onOpened;
  const Body({Key? key, required this.z, required this.onOpened})
      : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedTopping = 0;
  List<EnjoyCategory> enjoyList = [
    EnjoyCategory(
      icon: Images.kuspitsa,
      title: 'pizza',
      borderColor: const Color(0xFFF0CAC1),
      backgroundColor: const Color(0xFFF0CCC1),
    ),
    EnjoyCategory(
      icon: Images.burgermini,
      title: 'Burger',
      borderColor: const Color(0xFF3EC032),
      backgroundColor: const Color(0xFFA9E88B),
    ),
    EnjoyCategory(
      icon: Images.hotdog,
      title: 'Sausage',
      borderColor: const Color(0xFFC1DAF0),
      backgroundColor: const Color(0xFFC1DAF0),
    ),
    EnjoyCategory(
      icon: Images.shaurma,
      title: 'Samosa',
      borderColor: const Color(0xFFF0E3C1),
      backgroundColor: const Color(0xFFF0E3C1),
    ),
  ];

  void _selectTopping(int index) {
    _selectedTopping = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBarWithIcon(
                icon: IconButton(
                  onPressed: () {
                    widget.z.open?.call();
                    widget.onOpened();
                  },
                  icon: SvgPicture.asset(Svgs.menuicon),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Text(
                  'Enjoy Delicious food',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => EnjoyCard(
                    onPressed: () => _selectTopping(index),
                    enjoy: enjoyList[index],
                    isActive: _selectedTopping == index,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 22.0,
                  ),
                  itemCount: 4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular restaurants',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View all(29)',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BigBoysCheese(),
                    ),
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => const BurgersButtom(),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 22.0,
                    ),
                    itemCount: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
