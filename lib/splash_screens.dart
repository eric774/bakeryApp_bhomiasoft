import 'dart:async';

// import 'package:flipkart_flutter_ui/src/Constant/Constant.dart';
import 'package:bakery/body.dart';
import 'package:bakery/main.dart';
// import 'package:bakery/login/wrapper.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'login/api/pages/login_page.dart';

// class AuthenticationWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();

//     if (firebaseUser != null) {
//       return BodyOTP();
//     }
//     return LoginPage();
//   }
// }

class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 6);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    // Navigator.of(context).pushReplacementNamed(Body);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => currentPage
            // AuthenticationWrapper()
            ));
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/PlBaQBS.gif'),
            fit: BoxFit.contain,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: new Image.asset(
                      'assets/powered_by.png',
                      height: 30.0,
                      fit: BoxFit.scaleDown,
                    ))
              ],
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: new Image.asset(
                    'assets/logo.png',
                    width: animation.value * 100,
                    height: animation.value * 100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
