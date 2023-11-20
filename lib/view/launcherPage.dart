import 'dart:async';
import 'package:flutter/material.dart';

import '../constan/constan.dart';

class LauncherPage extends StatefulWidget {
  @override
  LauncherPageState createState() => LauncherPageState();
}

class LauncherPageState extends State<LauncherPage>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Image.asset(
                  'gambar/logo.png',
                  width: animation.value * 200,
                  height: animation.value * 200,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
