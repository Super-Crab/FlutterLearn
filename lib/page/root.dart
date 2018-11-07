import 'package:flutter/material.dart';
import 'PlaceholderWidget.dart';
import 'index.dart';
import '../Calculator/calculator.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var title = 'My Flutter App';
    return new MaterialApp(
      title: title,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  int _currentIndex = 0;

  var appBarTitles = ['Home', 'Message', 'Profile'];

  final List<Widget> _children = [
    new Index(),
    new CalculatorApp(),
    PlaceholderWidget(Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text(appBarTitles[0])),
          BottomNavigationBarItem(
              icon: new Icon(Icons.mail), title: new Text(appBarTitles[1])),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person), title: new Text(appBarTitles[2]))
        ],
      ),
    );
  }


  @override
  void initState() {
    print('initState()');
  }

  void onTabTapped(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}