import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar splashAppBar(context) => AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarBrightness: Brightness.dark,
      ),
    );
