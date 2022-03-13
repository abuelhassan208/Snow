import 'package:flutter/material.dart';
import 'package:snow_ar/core/navigation/core_nav.dart';
import 'package:snow_ar/screens/splash/view.dart';


class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Something went wrong Check your internet connection and try again',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                  fontSize: 20,
                  fontFamily: 'Quintessential',
                  fontWeight: FontWeight.w600,
                ),
              ),
              MaterialButton(
                elevation: 10,
                splashColor: Colors.transparent,
                onPressed: () {
                  CoreNav.pushAndRemoveUntil(context, const SplashView());
                },
                child: Container(

                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/cloud.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'try again',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontFamily: 'Quintessential',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
