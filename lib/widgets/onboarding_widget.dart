import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 46.0),
            Image.asset(image),
          ],
        ),
      ),
    );
  }
}


// IntroductionScreen(
//         showDoneButton: false,
//         showNextButton: false,
//         dotsDecorator: const DotsDecorator(
//           activeSize: Size(8.0, 8.0),
//           size: Size(6.0, 6.0),
          // activeColor: AppColors.dotsColor,
//         ),
//         rawPages: [
          // PageView(
          //   controller: controller,
          //   children: [
          //     Column(
          //       children: <Widget>[
          //         const Text(
          //           'Order from your favourite \nstores or vendros',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //             fontSize: 24.0,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //         const SizedBox(height: 46.0),
          //         Image.asset(Images.onBoard1),
          //       ],
          //     ),
          //   ],
          // ),
//           PageView(
//             controller: controller,
//             children: [
              // Column(
              //   children: <Widget>[
              //     const Text(
              //       'Choose from a wide range of \n  delicious meals',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontSize: 24.0,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     const SizedBox(height: 46.0),
              //     Image.asset(Images.onboard2),
              //   ],
              // ),
//             ],
//           ),
//           PageView(
//             controller: controller,
//             children: [
              // Column(
              //   children: <Widget>[
              //     const Text(
              //       'Enjoy instant delivery \n and payment',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontSize: 24.0,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     const SizedBox(height: 46.0),
              //     Image.asset(Images.onBoard3),
              //   ],
              // ),
//             ],
//           ),
//         ],
//       ),