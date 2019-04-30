import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-04-30 15:55
 */
class StateC extends StatefulWidget {
  static final String sName = "混合管理";

  @override
  StateCState createState() => new StateCState();
}

class StateCState extends State<StateC> {

  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ChildrenC(onChanged: _handleTapBoxChanged, active: _active),
    );
  }
}

class ChildrenC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  ChildrenC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  @override
  ChildrenCState createState() => new ChildrenCState();
}

class ChildrenCState extends State<ChildrenC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
              widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight ? new Border.all(
                color: Colors.teal[700], width: 10.0) : null
        ),
      ),
    );
  }
}
