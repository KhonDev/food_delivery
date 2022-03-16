import 'package:flutter/material.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/screens/create_account_screen.dart';
import 'package:food_app/screens/reset_password_screen.dart';
import 'package:food_app/theme/app_color.dart';
import 'package:food_app/widgets/custom_button_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _passController = TextEditingController();
  final _pass = 'admin321';
  String? errorText;

  void validate() {
    final passText = _passController.text.trim();

    if (passText.isEmpty) {
      errorText = 'Please, enter your password!';
    } else if (passText == _pass) {
      errorText = null;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ResetPassword(),
        ),
      );
    } else {
      errorText = 'Email or password incorrect!';
    }
    setState(() {});
  }

  @override
  void dispose() {
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
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 20.0),
            child: GestureDetector(
              onTap: () => Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateAccountScreen(),
                ),
              ),
              child: const Text(
                'Cancle',
                style: TextStyle(
                    color: AppColors.skipColor,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Column(
                children: const <Widget>[
                  SizedBox(height: 40.0),
                  Text(
                    'Forgot password',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                      'Enter your email address to request a\n                  password reset.'),
                ],
              ),
              const SizedBox(height: 50.0),
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0, right: 220.0),
                child: Text('Email Address'),
              ),
              TextField(
                controller: _passController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  isDense: true,
                  hintStyle: const TextStyle(fontSize: 12.0),
                  hintText: '  Enter email address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
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
              Spacer(),
              CustomButtonWidget(title: 'Enter', onPressed: validate),
            ],
          ),
        ),
      ),
    );
  }
}
