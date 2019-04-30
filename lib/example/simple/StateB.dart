import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-04-30 15:35
 */

class StateB extends StatefulWidget {
  static final String sName = "父widget管理子widget的state";

  @override
  StateBState createState() => new StateBState();
}

class StateBState extends State<StateB> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ChildrenB(
        onChanged: _handleTapboxChanged,
        active: _active,
      ),
    );
  }
}

class ChildrenB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  ChildrenB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
