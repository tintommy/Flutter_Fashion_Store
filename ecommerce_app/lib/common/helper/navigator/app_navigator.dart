import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => widget)));
  }

  void push(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: ((context) => widget)));
  }

  void pushAndRemoveUntil(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: ((context) => widget)),
        (Route<dynamic> route) => false);
  }
}
