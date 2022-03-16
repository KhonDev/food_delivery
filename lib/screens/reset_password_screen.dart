import 'package:flutter/material.dart';
import 'package:food_app/resources/resources.dart';
import 'package:food_app/screens/forgot_password_screen.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/theme/app_color.dart';
import 'package:food_app/widgets/custom_button_widget.dart';
import 'package:food_app/widgets/login_button_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _passController = TextEditingController();
  final _pass = '3321';
  String? errorText;
  void validate() {
    final passText = _passController.text.trim();

    if (passText.isEmpty) {
      errorText = 'Please,enter code!';
    } else if (passText == _pass) {
      errorText = null;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      errorText = 'code incorrect!';
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
                  builder: (context) => const ForgotPassword(),
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
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      SizedBox(height: 90.0),
                      Text(
                        'Reset Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24.0),
                      ),
                      SizedBox(height: 15.0),
                      Text('A reset code has been sent to your email'),
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 15.0,
                    ),
                    child: Text('Enter code'),
                  ),
                  PinCodeTextField(
                    controller: _passController,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    appContext: context,
                    autoDismissKeyboard: true,
                    autoFocus: true,
                    animationType: AnimationType.none,
                    cursorColor: Colors.black,
                    length: 4,
                    enableActiveFill: true,
                    boxShadows: [
                      BoxShadow(
                        color: const Color(0xFF02202C).withOpacity(.05),
                        offset: const Offset(0, 20),
                        blurRadius: 40.0,
                      ),
                    ],
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    pinTheme: PinTheme.defaults(
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      activeColor: Colors.transparent,
                      inactiveColor: Colors.transparent,
                      selectedColor: Colors.transparent,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15),
                      fieldHeight: 50.0,
                      fieldWidth: 50.0,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  CustomButtonWidget(
                      title: 'Create an account', onPressed: validate),
                  const SizedBox(height: 40.0),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
