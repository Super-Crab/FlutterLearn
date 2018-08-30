import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Container(
      height: 10.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Center(
            child: new Text("1"),
          ),
          new Center(
            child: new Text("2"),
          ),
          new Center(
            child: new Text("3"),
          ),
        ],
      ),
    );
  }
}