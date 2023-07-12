import 'package:basecode/view/menuPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constan/constan.dart';
import '../controller/authController.dart';
import 'loginPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());
    switch (authC.loginStatus) {
      case LoginStatus.notSignIn:
        return LoginPage();
      case LoginStatus.signIn:
        return MenuPage();
    }
  }
}
