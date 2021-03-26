import 'dart:async';

import 'package:flutter/material.dart';
import 'package:getsetwasherdemoproject/login/LoginScreen.dart';
import 'package:getsetwasherdemoproject/roleselection/RoleSelectionScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{


  var visible=true;
  AnimationController animationController;
  Animation<double> animation;



  startTime() async{
    var _duration=new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => RoleSelectionScreen(),));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 4));

    animation =new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() {
      this.setState(() {

      });
    });
    animationController.forward();

    setState(() {
      visible=!visible;
    });

    startTime();
  }

  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // new Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //
          //     Padding(padding: EdgeInsets.only(bottom: 30.0),child:new Image.asset('assets/car.png',height: 25.0,fit: BoxFit.scaleDown,))
          //
          //   ],),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/racing_car.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
