import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final String value;
  const TextView({Key? key, required this.text, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Text(
        " $text:  [ $value . ] ",
        style:  TextStyle(
          fontSize: 20,
          fontFamily: 'Quintessential',
          fontWeight: FontWeight.w600,
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }
}
