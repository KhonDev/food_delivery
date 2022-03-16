import 'package:flutter/material.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/screens/forgot_password_screen.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/theme/app_color.dart';
import 'package:food_app/widgets/custom_button_widget.dart';

class LoginToYourAccount extends StatefulWidget {
  const LoginToYourAccount({Key? key}) : super(key: key);

  @override
  State<LoginToYourAccount> createState() => _LoginToYourAccountState();
}

class _LoginToYourAccountState extends State<LoginToYourAccount> {
  final _loginController = TextEditingController();
  final _passController = TextEditingController();
  final _login = 'admin@mail.ru';
  final _pass = 'admin321';
  String? errorText;

  void validate() {
    final loginText = _loginController.text.trim();
    final passText = _passController.text.trim();

    if (loginText.isEmpty || passText.isEmpty) {
      errorText = 'Please, enter your email or password!';
    } else if (loginText == _login && passText == _pass) {
      errorText = null;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      errorText = 'Email or password incorrect!';
    }
    setState(() {});
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Image.asset(
      //     Images.group,
      //     width: 40.0,
      //   ),
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      //   actions: [
      //     TextButton(
      //       onPressed: () => Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const HomeScreen(),
      //         ),
      //       ),
      //       child: const Text(
      //         'Skip',
      //         style: TextStyle(
      //             color: AppColors.skipColor,
      //             decoration: TextDecoration.underline),
      //       ),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      SizedBox(height: 40.0),
                      Text(
                        'Login to your account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24.0),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                          'Good to see you again, enter your details \nbelow to continue ordering.'),
                    ],
                  ),
                ),
                const SizedBox(height: 50.0),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0, bottom: 10.0),
                  child: Text('Email Address'),
                ),
                TextField(
                  controller: _loginController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    isDense: true,
                    hintStyle: const TextStyle(fontSize: 12.0),
                    hintText: 'Enter email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.only(left: 26.0, bottom: 10.0),
                  child: Text('Password'),
                ),
                TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Enter password',
                    hintStyle: const TextStyle(fontSize: 12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassword(),
                        ),
                      ),
                      child: const Text(
                        'Forgot password ?',
                        style: TextStyle(color: AppColors.buttonColor),
                      ),
                    ),
                  ],
                ),
                if (errorText != null)
                  Center(
                    child: Text(
                      errorText!,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 214.0, bottom: 20.0),
                  child: Center(
                    child: SizedBox(
                      width: 204.0,
                      height: 40.0,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          elevation: .5,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () {},
                        icon: Image.asset(Images.googleicon),
                        label: const Text(
                          'Sing-in with Google',
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
                ),
                CustomButtonWidget(
                  title: 'Login',
                  onPressed: validate,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
