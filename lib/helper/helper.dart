import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HelperController {
  static textStyle(double fontSize, Color color, FontWeight fontWeight) {
    return GoogleFonts.poppins().copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

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

  static String formatRupiah(
      {required double nominal,
      required int decimalDigit,
      required String symbol}) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: symbol + ' ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(nominal);
  }
}
