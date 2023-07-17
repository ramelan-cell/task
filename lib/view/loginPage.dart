import 'package:basecode/component/footerWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/buttonWidget.dart';
import '../component/textFormFieldWidget.dart';
import '../constan/constan.dart';
import '../controller/authController.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.put(AuthController());
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormFieldWidget(
                  inputType: TextInputType.text,
                  text: 'Username',
                  controller: authC.username,
                  obscureText: false,
                  readOnly: false,
                  iconWidget: Icon(
                    Icons.person,
                    color: primaryColor,
                  ),
                  prefixIcon: true,
                  suffixIcon: false,
                ),
                Obx(
                  () => TextFormFieldWidget(
                    inputType: TextInputType.none,
                    text: 'Password',
                    controller: authC.password,
                    obscureText: authC.secureText.value,
                    readOnly: false,
                    iconWidget: IconButton(
                        onPressed: () => authC.showHide(),
                        icon: Icon((authC.secureText.value == false)
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    prefixIcon: true,
                    suffixIcon: false,
                  ),
                ),
                InkWell(
                  onTap: () => authC.login(),
                  child: ButtonWidget(
                      text: 'Login',
                      color: primaryColor,
                      colorTxt: secondColor),
                ),
                FooterLoginPage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
