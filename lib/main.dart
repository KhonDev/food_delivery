import 'package:flutter/material.dart';
import 'package:food_app/providers/orders_provider.dart';
import 'package:food_app/screens/delivery_method_screen.dart';
import 'package:food_app/screens/home2_screen.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/onboarding_screen.dart';
import 'package:food_app/theme/app_color.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isOnboardingShowinng =
        Hive.box('settings').get('onboardShown', defaultValue: false);
    return ChangeNotifierProvider(
      create: (_) => OrdersProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backround,
          fontFamily: 'DMSans',
        ),
        home: _isOnboardingShowinng
            ? const HomeScreen()
            : const OnboardingScreen(),
      ),
    );
  }
}
