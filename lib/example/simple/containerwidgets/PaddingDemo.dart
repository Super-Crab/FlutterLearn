import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-05-09 11:13
 */
class PaddingDemo extends StatelessWidget {

  static final String sName = "PaddingDemo";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('PaddingDemo'),
      ),
      body: new Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Hello World"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('I am Jack'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
                child: Text('Your friend'),
              )
            ],
          ),
        ),
      )
    );
  }
}