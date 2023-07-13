import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperController {
  static void messageBoxError(String text) {
    Get.snackbar('Error', text,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
        colorText: Colors.white);
  }

  static void messageBoxWarning(String text) {
    Get.snackbar('Warning', text,
        backgroundColor: Colors.yellow,
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
        colorText: Colors.black);
  }

  static void messageBoxSuccess(String text) {
    Get.snackbar('Success', text,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
        colorText: Colors.white);
  }
}