import 'package:flutter/material.dart';

class GestureDetectorDemo extends StatefulWidget {
  static final String sName = "GestureDetectorDemo";

  @override
  _GestureDetectorDemoState createState() => new _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends State<GestureDetectorDemo> {
  String _operation = "No Gesture detected";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(GestureDetectorDemo.sName),
        ),
        body: Stack(
          children: <Widget>[
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 200.0,
                height: 100.0,
                child: Text(
                  _operation,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () => updateText("Tap"),
              onDoubleTap: () => updateText("DoubelTap"),
              onLongPress: () => updateText("LongPress"),
            ),
          ],
        ));
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}
