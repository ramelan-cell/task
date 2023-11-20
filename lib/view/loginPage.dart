import 'package:basecode/component/footerWidget.dart';
import 'package:basecode/helper/helper.dart';
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
                Center(
                  child: Text(
                    'Welcome to',
                    style: HelperController.textStyle(
                        13, secondColor, FontWeight.normal),
                  ),
                ),
                Center(
                  child: Text(
                    'Task Management',
                    style: HelperController.textStyle(
                        25, primaryColor, FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text('please login to access the app',
                      style: HelperController.textStyle(
                          13, secondColor, FontWeight.normal)),
                ),
                SizedBox(
                  height: 30,
                ),
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
                  maxLine: 1,
                ),

                Obx(
                  () => TextFormFieldWidget(
                    inputType: TextInputType.text,
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
                    maxLine: 1,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => authC.login(),
                  child: ButtonWidget(
                      text: 'Login', color: primaryColor, colorTxt: whiteColor),
                ),
                // FooterLoginPage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
