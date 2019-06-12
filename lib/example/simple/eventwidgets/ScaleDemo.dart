import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-12 16:43
 */

class ScaleDemo extends StatefulWidget {
  static final String sName = "ScaleDemo";

  @override
  ScaleDemoState createState() => new ScaleDemoState();
}

class ScaleDemoState extends State<ScaleDemo> {

  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(ScaleDemo.sName),
      ),
      body: new Center(
        child: GestureDetector(
          child: Image.asset(
            "images/avatar.png",
            width: _width,
          ),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              _width = 200 * details.scale.clamp(.8, 10.0);
            });
          },
        ),
      ),
    );
  }
}
