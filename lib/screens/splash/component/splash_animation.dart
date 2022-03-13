import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashAnimation extends StatelessWidget {
  const SplashAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 28,
          fontFamily: 'Quintessential',
          fontWeight: FontWeight.w700),
      child: AnimatedTextKit(
        pause: const Duration(seconds: 1),
        totalRepeatCount: 1,
        animatedTexts: [
          WavyAnimatedText('WelCome'),
          WavyAnimatedText('to SNOW'),
          WavyAnimatedText('Loading ... '),
        ],
        isRepeatingAnimation: true,
      ),
    );
  }
}
