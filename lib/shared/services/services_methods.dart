import 'package:flutter/material.dart';

class ServicesMethods{
  static void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );

// Navigate to Screen and replacement function
  static void navigateToAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false,
  );

  static void navigateToAndReplace(BuildContext context, Widget widget) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );
}