import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {
  static void changeFieldFocus(
      BuildContext context, FocusNode current, FocusNode nextfocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static void toastMessage(String msg, Color color) {
    Fluttertoast.showToast(msg: msg, backgroundColor: color);
  }

  static snackbar(String title, String message) {
    Get.snackbar(title, message);
  }
}