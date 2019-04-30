import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-04-30 10:58
 */

class StateA extends StatefulWidget {
  static final String sName = "Widget管理自身状态";

  @override
  StateAState createState() => new StateAState();
}

class StateAState extends State<StateA> {

  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: _handleTap,
        child: new Container(
            child: new Center(
              child: new Text(
                _active ? 'Active' : 'Inactive',
                style: new TextStyle(fontSize: 32.0, color: Colors.white),
              ),
            ),
          width: 200.0,
          height: 200.0,
          decoration: new BoxDecoration(color: _active ? Colors.lightGreen[700] : Colors.lightGreen[600]),
        )
    );
  }
}