import 'dart:convert';
import 'dart:io';

import 'package:basecode/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constan/constan.dart';
import '../service/api.dart';

class AuthController extends GetxController {
  LoginStatus loginStatus = LoginStatus.notSignIn;
  final box = GetStorage();
  var flagLogin = 0.obs;
  var secureText = false.obs;
  var userId = ''.obs;
  var nameUser = ''.obs;
  List dataListTask = [];
  List detailTaskCategory = [];
  List dataCategory = [];
  List dataCheckList = [];

  late TextEditingController username;
  late TextEditingController password;
  List<TextEditingController> notes =
      List.generate(1000, (i) => TextEditingController());

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

  submitTask(String id) async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      final response = await http.post(Uri.parse(BaseUrl.tasksubmit),
          body: {"apikey": BaseUrl.apiKey, "idtask": id});
      final data = jsonDecode(response.body);
      await EasyLoading.dismiss();
      if (data['status'] == 0) {
        HelperController.messageBoxError(data['message']);
      } else {
        HelperController.messageBoxSuccess(data['message']);
      }
      update();
    } on SocketException catch (_) {
      await EasyLoading.dismiss();
      Get.snackbar('Error', "No Connection Internet , Please Try Again",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
  }

  updateImages(String id, File? tempFile, String idcategory) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse(BaseUrl.updateImage));
      request.fields.addAll({'apikey': BaseUrl.apiKey, 'idchecklist': id});
      request.files
          .add(await http.MultipartFile.fromPath('photo', tempFile!.path));

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        print(value);
      });

      getCheckList(idcategory);
      update();
    } on SocketException catch (_) {
      Get.snackbar('Error', "No Connection Internet , Please Try Again",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
  }

  updateNotes(String id, String note, String idcategory) async {
    try {
      final response = await http.post(Uri.parse(BaseUrl.updateNotes),
          body: {"apikey": BaseUrl.apiKey, "idchecklist": id, "note": note});
      getCheckList(idcategory);
      update();
    } on SocketException catch (_) {
      Get.snackbar('Error', "No Connection Internet , Please Try Again",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
  }

  updateCheckList(String id, String checklist1, String checklist2,
      String checklist3, String idcategory) async {
    try {
      final response =
          await http.post(Uri.parse(BaseUrl.updateCheckList), body: {
        "apikey": BaseUrl.apiKey,
        "idchecklist": id,
        "check1": checklist1,
        "check2": checklist2,
        "check3": checklist3,
        "namauser": box.read('name').toString()
      });
      getCheckList(idcategory);
      update();
    } on SocketException catch (_) {
      Get.snackbar('Error', "No Connection Internet , Please Try Again",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
  }

  getCheckList(String id) async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      final response = await http.post(Uri.parse(BaseUrl.checkList),
          body: {"apikey": BaseUrl.apiKey, "idcategory": id});
      final data = jsonDecode(response.body);
      print(data);
      await EasyLoading.dismiss();
      dataCheckList = data['result'];
      update();
    } on SocketException catch (_) {
      await EasyLoading.dismiss();
      Get.snackbar('Error', "No Connection Internet , Please Try Again",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
  }

  getCategory(String id) async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      final response = await http.post(Uri.parse(BaseUrl.category),
          body: {"apikey": BaseUrl.apiKey, "idkategorihead": id});
      final data = jsonDecode(response.body);
      print(data);
      await EasyLoading.dismiss();
      dataCategory = data['data'];

      update();
    } on SocketException catch (_) {
      await EasyLoading.dismiss();
      Get.snackbar('Error', "No Connection Internet , Please Try Again",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
  }

  getDetailTaskCategory(String id) async {
    print(id);
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      final response = await http.post(Uri.parse(BaseUrl.detailTask),
          body: {"apikey": BaseUrl.apiKey, "idtask": id});
      final data = jsonDecode(response.body);
      await EasyLoading.dismiss();
      detailTaskCategory = data['data'];
      update();
    } on SocketException catch (_) {
      await EasyLoading.dismiss();
      Get.snackbar('Error', "No Connection Internet , Please Try Again",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
  }

  getListTask(String id) async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      final response = await http.post(Uri.parse(BaseUrl.tasklist),
          body: {"apikey": BaseUrl.apiKey, "id": id});
      final data = jsonDecode(response.body);
      print(data);
      await EasyLoading.dismiss();
      dataListTask = data['data'];
      update();
    } on SocketException catch (_) {
      await EasyLoading.dismiss();
      Get.snackbar('Error', "No Connection Internet , Please Try Again",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
  }

  void login() async {
    if (username.text == "") {
      HelperController.messageBoxError('Username Wajib di isi');
      return;
    }

    if (password.text == "") {
      HelperController.messageBoxError('Password wajib di isi');
      return;
    }

    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );

    try {
      final response = await http.post(Uri.parse(BaseUrl.login), body: {
        "apikey": BaseUrl.apiKey,
        "username": username.text,
        "password": password.text
      });
      final data = jsonDecode(response.body);
      await EasyLoading.dismiss();

      if (data['value'] == 1) {
        savePref(
            1,
            data['result'][0]['id'].toString(),
            data['result'][0]['name'],
            data['result'][0]['address'] ?? '',
            data['result'][0]['email'] ?? '',
            data['result'][0]['handphone'] ?? '',
            data['result'][0]['picture'] ?? '',
            data['result'][0]['active'] ?? '1');
        getPref();
        Get.offAndToNamed(HOME_SCREEN);
        HelperController.messageBoxSuccess(data['message']);
        return;
      } else {
        HelperController.messageBoxError(data['message']);
      }
    } on SocketException catch (_) {
      await EasyLoading.dismiss();
      Get.snackbar('Error', "No Connection Internet , Please Try Again",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
  }

  savePref(int value, String id, String name, String address, String email,
      String hp, String poto, String active) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("value", value);
    preferences.setString("userId", id);
    preferences.setString("name", name);
    preferences.setString("address", address);
    preferences.setString("email", email);
    preferences.setString("hp", hp);
    preferences.setString("poto", poto);
    preferences.setString("active", active);
    preferences.commit();

    box.write('name', name);
    box.write('userId', id);
    box.write('hp', hp);
    update();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getInt("value") != null) {
      flagLogin.value = preferences.getInt("value")!;
      userId.value = preferences.getString("userId")!;
      nameUser.value = preferences.getString("name")!;
      if (flagLogin.value == 1) {
        getListTask(userId.value);
      }
      loginStatus =
          flagLogin.value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
      flagLogin.refresh();
    }

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
