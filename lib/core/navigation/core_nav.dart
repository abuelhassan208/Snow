import 'package:flutter/material.dart';

class CoreNav {
  static void pushReplacement(context, route) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => route));

  static void push(context, route) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => route));

  static void pushAndRemoveUntil(context, pageRoute) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => pageRoute), (route) => false);

  static void pop(context) => Navigator.of(context).pop();
}
