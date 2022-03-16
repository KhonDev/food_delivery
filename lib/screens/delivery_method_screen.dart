import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:food_app/resources/resources.dart';
import 'package:food_app/screens/big_boys_cheese_screen.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/payment_screen.dart';
import 'package:food_app/screens/successfully_screen.dart';
import 'package:food_app/theme/app_color.dart';
import 'package:food_app/widgets/custom_button_widget.dart';
import 'package:food_app/widgets/pay_ments_widget.dart';

class DeliveryMethod extends StatefulWidget {
  const DeliveryMethod({Key? key}) : super(key: key);

  @override
  State<DeliveryMethod> createState() => _DeliveryMethodState();
}

class _DeliveryMethodState extends State<DeliveryMethod> {
  int _selectedTopping = 0;
  bool isPayArrival = false;
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

  void _selectTopping(int index) {
    _selectedTopping = index;
    setState(() {});
  }

  void _togglePayArrival() {
    isPayArrival = !isPayArrival;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      SizedBox(
                        child: Text(''),
                      ),
                    ],
                  ),
                  const Text(
                    'Delivery method',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DMSans'),
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '137 Teaticket Hwy, East \nFalmouth MA 2536',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Change',
                          style: TextStyle(
                            color: AppColors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '+234 9011039271',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Change',
                          style: TextStyle(
                            color: AppColors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0, bottom: 24.0),
                    child: Text(
                      'Payment',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DMSans'),
                    ),
                  ),
                  if (!isPayArrival) const PayMents(),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 10.0),
                    child: GestureDetector(
                      onTap: _togglePayArrival,
                      child: Row(
                        children: [
                          Icon(
                            isPayArrival
                                ? Icons.brightness_1_rounded
                                : Icons.brightness_1_outlined,
                          ),
                          const SizedBox(width: 10.0),
                          const Text('Pay on arrival'),
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    'Pay with cash/POS upon arrival ',
                    style: TextStyle(
                      color: AppColors.red,
                    ),
                  ),
                  const SizedBox(height: 64.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Delivery Fee',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        '20',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          '520',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        '540',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 27.0),
                  CustomButtonWidget(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessfullyScreen(),
                      ),
                    ),
                    title: 'Proceed to Payment',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class PaymentCard extends StatelessWidget {
//   final Topping topping;
//   final bool isActive;
//   final VoidCallback onPressed;
//   const PaymentCard({
//     Key? key,
//     required this.topping,
//     required this.onPressed,
//     this.isActive = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 130.0,
//       child: OutlinedButton(
//         style: OutlinedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(
//             vertical: 11.0,
//             horizontal: 8.0,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(50.0),
//           ),
//           side: isActive
//               ? const BorderSide(
//                   color: Color(0xFFF9881F),
//                 )
//               : null,
//         ),
//         onPressed: onPressed,
//         child: Container(
//           alignment: Alignment.center,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image.asset(topping.icon),
//               const SizedBox(width: 10.0),
//               Text(
//                 topping.title,
//                 style: const TextStyle(color: Colors.black),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
