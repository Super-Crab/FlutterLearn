import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-03 15:50
 */

class DecoratedBoxDemo extends StatelessWidget {

  static final String sName = "DecoratedBoxDemo";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(sName),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
