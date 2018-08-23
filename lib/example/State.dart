import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'State',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('State demo'),
        ),
        body: new Center(
          child: new TapboxA(),
        ),
      )
    );
  }
}


class TapboxB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
    );
  }
}


class TapboxA extends StatefulWidget {

  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {

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

        child: new Text(
          _active ? 'Active' : 'Inactive',
          style: new TextStyle(fontSize: 32.0, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

