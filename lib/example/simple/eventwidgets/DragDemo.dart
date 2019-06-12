import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-12 16:30
 */

class DragDemo extends StatefulWidget {
  static final String sName = "DragDemo";

  @override
  DragDemoState createState() => new DragDemoState();
}

class DragDemoState extends State<DragDemo> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(DragDemo.sName),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text('A'),
              ),
              onPanDown: (DragDownDetails e) {
                print("用户手指按下: ${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                print(e.velocity);
              },
            ),
          )
        ],
      ),
    );
  }
}
