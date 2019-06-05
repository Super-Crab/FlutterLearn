import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-05 15:42
 */

class WillPopScopeDemo extends StatefulWidget {
  static final String sName = "WillPopScopeDemo";

  @override
  WillPopScopeDemoState createState() => new WillPopScopeDemoState();
}

class WillPopScopeDemoState extends State<WillPopScopeDemo> {
  DateTime _lastPressAt;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        if (_lastPressAt == null ||
            DateTime.now().difference(_lastPressAt) > Duration(seconds: 1)) {
          _lastPressAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text("1秒内连续按两次返回键退出"),
      ),
    );
  }
}
