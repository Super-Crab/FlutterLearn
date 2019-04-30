import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-04-30 16:43
 */

class TextDemo extends StatelessWidget {
  static final String sName = "TextDemo";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TextDemo'),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Text(
              "Hello world",
              textAlign: TextAlign.center,
            ),
            new Text(
              "Hello world! I'm Jack. " * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Hello world",
              textScaleFactor: 1.5,
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
