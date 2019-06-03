import 'package:flutter/material.dart';
import 'dart:math' as math;
/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-03 16:41
 */

class TransformDemo extends StatelessWidget {
  static final String sName = "TransformDemo";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(sName),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.black,
            child: new Transform(
              alignment: Alignment.topRight,
              transform: new Matrix4.skewY(-0.3),
              child: new Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('Apartment for rent!'),
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.translate(
              offset: Offset(20.0, 5.0),
              child: Text("Hello World"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.green),
            child: Transform.rotate(
              angle: math.pi / 2,
              child: Text("旋转"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.scale(
              scale: 1.5,
              child: Text("Hello World"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Transform.scale(
                  scale: 1.5,
                  child: Text("Hello World"),
                ),
              ),
              Text(
                "你好",
                style: TextStyle(color: Colors.green, fontSize: 18.0),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text("Hello World"),
                ),
              ),
              Text(
                "你好",
                style: TextStyle(color: Colors.green, fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}
