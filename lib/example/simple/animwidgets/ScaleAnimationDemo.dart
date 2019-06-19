import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-17 10:49
 */

class ScaleAnimationDemo extends StatefulWidget {
  static final String sName = "ScaleAnimationDemo";

  @override
  ScaleAnimationDemoState createState() => new ScaleAnimationDemoState();
}

class ScaleAnimationDemoState extends State<ScaleAnimationDemo> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(ScaleAnimationDemo.sName),
      ),
      body: Image.asset(
        "images/avatar.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0,end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {
          ()=>{};
        });
      })
    ..addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
