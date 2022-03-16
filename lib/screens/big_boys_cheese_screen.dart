import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/you_cart_screen.dart';
import 'package:food_app/theme/app_color.dart';
import 'package:food_app/widgets/app_bar_with_icon.dart';
import 'package:food_app/widgets/category_button2.dart';
import 'package:food_app/widgets/custom_button_widget.dart';
import 'package:food_app/widgets/namig_widget.dart';

class BigBoysCheese extends StatefulWidget {
  const BigBoysCheese({Key? key}) : super(key: key);

  @override
  State<BigBoysCheese> createState() => _BigBoysCheeseState();
}

class _BigBoysCheeseState extends State<BigBoysCheese> {
  bool isMore = false;
  int _counter = 1;
  int _selectedTopping = 0;
  List<Topping> toppings = [
    Topping(
      icon: Images.regulerbun,
      title: 'Regular Bun',
    ),
    Topping(
      icon: Images.cheese,
      title: 'Cheese',
    ),
    Topping(
      icon: Images.meatsau,
      title: 'Meat sau',
    ),
  ];

  String text =
      'Our simple, classic cheeseburger begins with a 100% pure beef burger seasoned with just a pinch of salt and pepper. The McDonald’s Cheeseburger is topped';

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

  void _selectTopping(int index) {
    _selectedTopping = index;
    setState(() {});
  }

  void _toggleMore() {
    isMore = !isMore;
    if (isMore) {
      text += text;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AppBarWithIcon(
                      icon: IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        ),
                        icon: const Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                    const SizedBox(height: 39.0),
                    Container(
                      width: 258.0,
                      height: 224.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF02202C).withOpacity(.02),
                            offset: const Offset(0, 20),
                            blurRadius: 40.0,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        Images.burgerbig,
                      ),
                    ),
                    const SizedBox(height: 35.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFF9881F),
                            Color(0xFFFF774C),
                          ],
                        ),
                      ),
                      width: 110.0,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            splashRadius: 5.0,
                            icon: SvgPicture.asset(Svgs.minus),
                            onPressed: _counterMinus,
                          ),
                          Text(
                            '$_counter',
                            style: const TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            splashRadius: 5.0,
                            icon: SvgPicture.asset(Svgs.plyus),
                            onPressed: _counterPlyus,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35.0),
                    const Text(
                      'Big boys Cheese burger',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Naming(
                            isSvg: true,
                            icon: Svgs.star1,
                            text: '4+',
                          ),
                          Naming(
                            icon: Images.ccall300,
                            text: '300cal',
                          ),
                          Naming(
                            icon: Images.clockminired,
                            text: '5-10min',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Stack(
                        // alignment: Alignment.bottomLeft,
                        children: <Widget>[
                          Text(text),
                          if (!isMore)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 53.0, left: 70.0),
                              child: GestureDetector(
                                onTap: _toggleMore,
                                child: const Text(
                                  'more',
                                  style: TextStyle(color: AppColors.red),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35.0),
                    const Padding(
                      padding: EdgeInsets.only(right: 210.0, bottom: 20.0),
                      child: Text(
                        'Toppings for you',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ToppinngCard(
                          onPressed: () => _selectTopping(index),
                          topping: toppings[index],
                          isActive: _selectedTopping == index,
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 22.0),
                        itemCount: toppings.length,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 20.0),
                itemCount: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButtonWidget(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const YourCartScreen(),
                  ),
                ),
                title: 'Add to cart',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Topping {
  final String icon;
  final String title;

  Topping({
    required this.icon,
    required this.title,
  });
}
