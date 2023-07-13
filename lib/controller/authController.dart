import 'package:basecode/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constan/constan.dart';

class AuthController extends GetxController {
  LoginStatus loginStatus = LoginStatus.notSignIn;
  final box = GetStorage();
  var flagLogin = 0.obs;
  var secureText = false.obs;

  late TextEditingController username;
  late TextEditingController password;

  showHide() {
    if (secureText.value == false) {
      secureText.value = true;
    } else {
      secureText.value = false;
    }
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("value", 0);
    preferences.commit();
    Get.deleteAll();
    Get.offAndToNamed(HOME_SCREEN);
  }

  void login() {
    if (username.text == "") {
      HelperController.messageBoxWarning('Username Wajib di isi');
      return;
    }

    if (password.text == "") {
      HelperController.messageBoxWarning('Password wajib di isi');
      return;
    }

    if (username.text == "admin" && password.text == "123") {
      savePref(1);
      getPref();
      Get.offAndToNamed(HOME_SCREEN);
      HelperController.messageBoxSuccess('Berhasil login');
      return;
    } else {
      HelperController.messageBoxError('Login gagal');
    }
  }

  savePref(int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("value", value);
    preferences.commit();
    update();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    flagLogin.value = preferences.getInt("value")!;
    loginStatus =
        flagLogin.value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    flagLogin.refresh();

    print(flagLogin.value);
  }

  @override
  void onInit() {
    print('LOGIN AWAL');
    getPref();
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
