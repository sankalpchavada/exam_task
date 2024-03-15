import 'package:firebase_connect/controller/auth_controller.dart';
import 'package:firebase_connect/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

import '../firebase_auth/auth_services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Duration loginTime = const Duration(milliseconds: 2250);
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: GetBuilder<AuthController>(builder: (controller) {
        return FlutterLogin(
          theme: LoginTheme(
              pageColorLight: Colors.white,
              pageColorDark: Colors.teal,
              buttonStyle: TextStyle(color: Colors.white, letterSpacing: 2)),
          logo: 'assets/icon.png',
          title: 'Autify',
          hideForgotPasswordButton: true,
          loginAfterSignUp: false,
          onLogin: (LoginData loginData) async {
            return await AuthHelper.authHelper.loginUserWithEmailAndPassword(
                email: loginData.name, password: loginData.password);
          },
          onSignup: (SignupData signupData) async {
            return await AuthHelper.authHelper.signUpUserWithEmailAndPassword(
                email: signupData.name!, password: signupData.password!);
          },
          onRecoverPassword: (_) {},
          onSubmitAnimationCompleted: () {
            if (AuthController.currentUser != null) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(),
                  ));
            }
          },
        );
      }),
    );
  }
}
