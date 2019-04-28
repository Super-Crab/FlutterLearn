import 'package:flutter/material.dart';
/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-04-28 13:42
 */

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('New Route'),
      ),
      body: Center(
        child: Text('This is new route'),
      ),
    );
  }
}