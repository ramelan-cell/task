import 'package:basecode/controller/baseController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/authController.dart';
import 'loginPage.dart';
import 'menuTabPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final authC = Get.put(AuthController());
  final baseC = Get.put(BaseController());
  @override
  void initState() {
    baseC.cekVersion(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Obx(() => (authC.flagLogin.value == 0) ? LoginPage() : MenuTabPage()),
    );
  }
}
