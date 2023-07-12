import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constan/constan.dart';

class AuthController extends GetxController {
  LoginStatus loginStatus = LoginStatus.notSignIn;
  final box = GetStorage();
  var flagLogin = 0.obs;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    flagLogin.value = preferences.getInt("value")!;
    loginStatus =
        flagLogin.value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    flagLogin.refresh();
  }

  @override
  void onInit() {
    getPref();
    super.onInit();
  }
}
