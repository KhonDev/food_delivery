import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/screens/home2_screen.dart';

import 'package:food_app/theme/app_color.dart';

class AuthenticatedScreen extends StatefulWidget {
  final bool isActive;

  const AuthenticatedScreen({
    Key? key,
    this.isActive = true,
  }) : super(key: key);

  @override
  State<AuthenticatedScreen> createState() => _AuthenticatedScreenState();
}

class _AuthenticatedScreenState extends State<AuthenticatedScreen> {
  final _screens = [
    const Home2(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];

  int _currentIndex = 0;

  void changeCurrentIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                _currentIndex == 0 ? Svgs.bulkHomeRed : Svgs.bulkHome,
              ),
              onPressed: () => changeCurrentIndex(0),
            ),
            IconButton(
              icon: SvgPicture.asset(Svgs.lightHeart),
              onPressed: () => changeCurrentIndex(1),
            ),
            const SizedBox(width: 60.0),
            IconButton(
              icon: SvgPicture.asset(Svgs.lightNotification),
              onPressed: () => changeCurrentIndex(2),
            ),
            IconButton(
              icon: SvgPicture.asset(Svgs.lightBuy),
              onPressed: () => changeCurrentIndex(3),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonColor,
        child: SvgPicture.asset(Svgs.searchicon),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}




// ClipRRect(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         ),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           onTap: onTap,
//           _currentIndex: _currentIndex,
//           items: [
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
                // _currentIndex == 0 ? Svgs.bulkHomeRed : Svgs.bulkHome,
//               ),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               activeIcon: SvgPicture.asset(Svgs.lightHeartRed),
//               icon: SvgPicture.asset(Svgs.lightHeart),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               activeIcon: SvgPicture.asset(Svgs.lightNotificationRed),
//               icon: SvgPicture.asset(Svgs.lightNotification),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               activeIcon: SvgPicture.asset(Svgs.lightBuyRed),
//               icon: SvgPicture.asset(Svgs.lightBuy),
//               label: '',
//             ),
//           ],
//         ),
//       ),