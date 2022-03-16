import 'package:flutter/material.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/login_to_you_acc_screen.dart';
import 'package:food_app/theme/app_color.dart';
import 'package:food_app/widgets/custom_button_widget.dart';
import 'package:food_app/widgets/login_button_widget.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confinController = TextEditingController();
  String? errorText;

  void validate() {
    final emailText = _emailController.text.trim();
    final passText = _passController.text.trim();
    final confirmText = _confinController.text.trim();

    if (emailText.isEmpty || passText.isEmpty || confirmText.isEmpty) {
      errorText = 'Please, enter email and password!';
    } else if (passText == confirmText && emailText.isNotEmpty) {
      errorText = null;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      errorText = 'Passwords don\'t matching';
    }
    setState(() {});
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
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
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ),
            child: const Text(
              'Skip',
              style: TextStyle(
                  color: AppColors.skipColor,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
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
                        'Create an account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24.0),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                          'Welcome friend, enter your details so lets get started in ordering food.'),
                    ],
                  ),
                ),
                const SizedBox(height: 50.0),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Text('Email Address'),
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    isDense: true,
                    hintStyle: const TextStyle(
                      fontSize: 12.0,
                    ),
                    hintText: 'Enter email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
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
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Text('Confirm Password'),
                ),
                TextField(
                  controller: _confinController,
                  obscureText: true,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Confirm Password',
                    hintStyle: const TextStyle(fontSize: 12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
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
                  padding: const EdgeInsets.only(top: 44.0, bottom: 20.0),
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
                  title: 'Create an account',
                  onPressed: validate,
                ),
                const Center(
                  child: LoginButtonWidget(text: 'Login to my account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
