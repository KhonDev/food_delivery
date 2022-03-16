import 'package:flutter/material.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/theme/app_color.dart';
import 'package:food_app/widgets/custom_button_widget.dart';
import 'package:food_app/widgets/login_button_widget.dart';
import 'package:food_app/widgets/onboarding_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'create_account_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentPage = 0;

  final Map<int, dynamic> onboardData = {
    0: {
      'image': Images.onBoard1,
      'title': 'Order from your favourite \nstores or vendors',
    },
    1: {
      'image': Images.onboard2,
      'title': 'Choose from a wide range of\ndelicious meals',
    },
    2: {
      'image': Images.onBoard3,
      'title': 'Enjoy instant delivery\nand payment',
    },
  };
  changeCurrentPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Images.group,
          width: 40.0,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              final _box = Hive.box('settings');
              _box.put('onboardShown', true);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color(0xFFFA5A1E),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 670.0,
                child: PageView.builder(
                  onPageChanged: (valeu) => changeCurrentPage(valeu),
                  controller: controller,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return OnBoardingWidget(
                      image: onboardData[index]['image'],
                      title: onboardData[index]['title'],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => CircularIndicator(
                      isActive: currentPage == index ? true : false),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: CustomButtonWidget(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateAccountScreen(),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 70.0, top: 20.0),
              child: LoginButtonWidget(text: 'Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({Key? key, required this.isActive}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: isActive ? 8.0 : 6.0,
      height: isActive ? 8 : 6.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.dotsColor : Colors.grey,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
