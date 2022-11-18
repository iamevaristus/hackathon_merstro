import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merstro/lib.dart';

enum Popup{
  success,
  error,
  warning,
  info
}

Color getColor(popup) {
  switch (popup) {
    case Popup.error:
      return MColors.error;
    case Popup.success:
      return MColors.green;
    case Popup.warning:
      return MColors.yellow;
    case Popup.info:
      return MColors.yellow;
    default:
  }
  throw CustomException("message");
}

showGetSnackbar({
  required String title,
  required String message,
  required Popup type,
  Duration duration = const Duration(milliseconds: 3000)
}) async {
  Get.snackbar(
    title,
    message,
    duration: duration,
    colorText: MColors.white,
    backgroundColor: getColor(type)
  );
}

class AppSnackBar{
  static success(String msg) => showSnackBar(
    message: msg,
    snackBarType: Popup.success
  );

  static error(String msg) => showSnackBar(
    message: msg,
    snackBarType: Popup.success
  );

  static warning(String msg) => showSnackBar(
    message: msg,
    snackBarType: Popup.success
  );

  static showSnackBar({
    required String message,
    required Popup snackBarType,
  }) {

    switch (snackBarType) {
      case Popup.success:
        return MColors.green;
      case Popup.error:
        return MColors.error;
      case Popup.warning:
        return MColors.yellow;
      default:
    }
  }
}