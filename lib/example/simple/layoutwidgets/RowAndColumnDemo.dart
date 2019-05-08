import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-05-08 14:39
 */

class RowAndColumnDemo extends StatelessWidget {

  static final String sName = "RowAndColumnDemo";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
      body: new Container(
        child:
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text(" hello world ", style: TextStyle(fontSize: 30.0),),
                Text(" I am Jack "),
              ],
            )
          ],
        ),
      ),
    );
  }
}