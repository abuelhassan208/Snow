import 'package:flutter/material.dart';

import '../../core/navigation/core_nav.dart';

class ConstAppBar {
  static AppBar bar({required String title, context, List<Widget>? actions}) =>
      AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(title),
        leading: context != null
            ? IconButton(
                onPressed: () {
                  CoreNav.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )
            : Container(
                color: Colors.transparent,
              ),
        actions: actions,
      );
}
