import 'package:flutter/material.dart';

class SharedMethods {
  static String? defaultValidation(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return message ?? 'this field is required';
    } else {
      return null;
    }
  }

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "برجاء إدخال عنوان البريد الإلكتروني الخاص بك";
    } else {
      return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)
          ? null
          : 'برجاء تحقق من بريدك الالكتروني';
    }
  }

  static String? defaultCheckboxValidation(bool? value, {String? message}) {
    if (value == false) {
      return message ?? 'this field is required';
    } else {
      return null;
    }
  }
  static void unFocusTextField(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}