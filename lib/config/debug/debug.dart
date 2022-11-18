import 'package:flutter/foundation.dart';

debugShow(text){
  if(kDebugMode){
    debugPrint(text.toString());
  }
}

class CustomException implements Exception{
  String message;
  String? code;

  CustomException(
    this.message,
    {this.code}
  ) {
    debugShow(toString());
  }

  @override
  String toString() {
    return "Custom Exception: $message";
  }
}