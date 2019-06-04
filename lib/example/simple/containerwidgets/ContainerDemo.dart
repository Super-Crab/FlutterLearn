import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-04 09:46
 */
class ContainerDemo extends StatelessWidget {
  static final String sName = "ContainerDemo";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(sName),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 50.0, left: 120.0),
            constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topRight,
                    radius: .98),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            alignment: Alignment.center,
            child: RotatedBox(
              quarterTurns: 4,
              child: Text(
                "5.20",
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.all(20.0),
            color: Colors.orange,
            child: Text("Hello World"),
          ),
          new Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.orange,
            child: Text("Hello World"),
          )
        ],
      ),
    );
  }
}
