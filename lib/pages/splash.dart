import 'dart:async';

import 'package:bmi_calculator/pages/bmiBody.dart';
import 'package:bmi_calculator/pages/terms.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  bool isAgreeBtn = false;

  double spTime = 0;
  var anOpacity = 0.0;
  Timer? timer;

  late AnimationController controller;

  static const String KEYLOGIN = "login";

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 30), (_) {
      setState(() {
        anOpacity = 1.0;
        if (spTime == 25.5) {
          timer?.cancel();
        } else {
          spTime += 0.5;
        }
      });
    });

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 500),
    );
    controller.forward();

    whereToGo();
  }

  @override
  void despose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: AnimatedOpacity(
                opacity: anOpacity,
                duration: Duration(seconds: 1, milliseconds: 500),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Image(
                    image: AssetImage("assets/bmi.png"),
                  ),
                ),
              ),
            ),
            Positioned(
              // bottom: MediaQuery.of(context).size.height * 0.45,
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: MediaQuery.of(context).size.width * 0.06,
                      child: RotationTransition(
                        turns:
                            Tween(begin: -1.23, end: -1.02).animate(controller),
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width * 0.22,
                          child: Image(
                            image: AssetImage("assets/arrow.png"),
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      // radius: 35,
                      radius: MediaQuery.of(context).size.width * 0.1,
                      backgroundColor: Colors.white,
                      child: Text(
                        "$spTime",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Text(
                "BMI Calculator",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(
      Duration(seconds: 2),
      () {
        if (isLoggedIn != null) {
          if (isLoggedIn) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BmiBody(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Terms(),
              ),
            );
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Terms(),
            ),
          );
        }
      },
    );
  }
}
