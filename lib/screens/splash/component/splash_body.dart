import 'package:flutter/material.dart';
import 'package:snow_ar/screens/splash/component/splash_animation.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            opacity: 0.80,
            image: ExactAssetImage(
              'assets/images/cloud.png',
              scale: MediaQuery.of(context).size.aspectRatio * 1.5,
            ),
          ),
        ),
        child: const Center(
          child: SplashAnimation(),
        ),
      ),
    );
  }
}
