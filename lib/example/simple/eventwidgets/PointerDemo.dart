import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-10 17:28
 */

class PointerDemo extends StatelessWidget {
  static final String sName = "PointerDemo";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(sName),
      ),
      body: Stack(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 200.0)),
              child:
                  DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
            ),
            onPointerDown: (event) => print("down0"),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200.0, 100.0)),
              child: Center(child: Text("左上角200*100范围内非文本区域点击")),
            ),
            onPointerDown: (event) => print("down1"),
          )
        ],
      ),
    );
  }
}
