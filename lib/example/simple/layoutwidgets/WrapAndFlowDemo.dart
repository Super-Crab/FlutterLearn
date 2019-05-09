import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-05-09 10:24
 */
class WrapAndFlowDemo extends StatelessWidget {

  static final String sName = "WrapAndFlowDemo";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('WrapAndFlowDemo'),
      ),
      body: new Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        alignment: WrapAlignment.center,
        children: <Widget>[
          new Chip(
            avatar: new CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("A"),
            ),
            label: new Text("Hamilton"),
          ),
          new Chip(
            avatar: new CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('M'),
            ),
            label: new Text("Lafayette"),
          ),
          new Chip(
            avatar: new CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('H'),
            ),
            label: new Text("Mulligan"),
          ),
          new Chip(
            avatar: new CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('J'),
            ),
            label: new Text("Laurens"),
          )
        ],
      ),
    );
  }
}
