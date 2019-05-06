import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-05-06 16:35
 */

class SwitchAndCheckBoxDemo extends StatefulWidget {

  static final String sName = "SwitchAndCheckBoxDemo";

  @override
  SwitchAndCheckBoxDemoState createState() => new SwitchAndCheckBoxDemoState();
}

class SwitchAndCheckBoxDemoState extends State<SwitchAndCheckBoxDemo> {

  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SwitchAndCheckBoxDemo'),
      ),
      body: new Column(
        children: <Widget>[
          Switch(
            value: _switchSelected,
            onChanged: (value){
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
            value: _checkboxSelected,
            onChanged: (value){
              setState(() {
                _checkboxSelected = value;
              });
            },
          )
        ],
      ),
    );
  }
}