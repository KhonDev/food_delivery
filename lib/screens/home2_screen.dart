import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/screens/body.dart';
import 'package:food_app/widgets/custom_button_widget.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  bool isOpen = false;

  void checkIsOpen() {
    isOpen = !isOpen;
    setState(() {});
  }

  final ZoomDrawerController z = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 24,
      style: DrawerStyle.Style1,
      openCurve: Curves.fastOutSlowIn,
      disableGesture: true,
      mainScreenTapClose: false,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      duration: const Duration(milliseconds: 500),
      backgroundColor: Colors.white,
      showShadow: true,
      angle: -8.0,
      clipMainScreen: true,
      mainScreen: AbsorbPointer(
        absorbing: isOpen,
        child: Body(
          z: z,
          onOpened: checkIsOpen,
        ),
      ),
      menuScreen: Theme(
        data: ThemeData.dark(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      z.close?.call();
                      checkIsOpen();
                    },
                    icon: const Icon(
                      Icons.expand_more,
                      color: Colors.black,
                    ),
                  ),
                  Image.asset(Images.bashara),
                  const Text(
                    'Marvis Ighedosa',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.black),
                  ),
                  const Text(
                    'dosamarvis@gmail.com',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset(Svgs.profile),
                        const SizedBox(width: 10.0),
                        const Text(
                          'My profile',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset(Svgs.worklid),
                        const SizedBox(width: 10.0),
                        const Text(
                          'Payment method',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset(Svgs.settingslid),
                        const SizedBox(width: 10.0),
                        const Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset(Svgs.chatlid),
                        const SizedBox(width: 10.0),
                        const Text(
                          'Help',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset(Svgs.paperlid),
                        const SizedBox(width: 10.0),
                        const Text(
                          'Privacy policy',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 250.0),
                    child: CustomButtonWidget(
                      onPressed: () {},
                      title: 'Log Out',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
