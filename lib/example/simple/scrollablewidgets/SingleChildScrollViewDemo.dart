import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-04 10:35
 */

class SingleChildScrollViewDemo extends StatelessWidget {

  static final String sName = "SingleChildScrollViewDemo";
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(sName),
      ),
      body: new Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: new Column(
              children: str.split("").map((c) => Text(c,textScaleFactor: 2.0,)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}