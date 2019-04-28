import 'package:flutter/material.dart';
import 'PlaceholderWidget.dart';
import 'index.dart';
import '../Calculator/calculator.dart';
import 'WidgetDemo.dart';
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

class HomeState extends State<Home> with SingleTickerProviderStateMixin{


  TabController _tabController;


  @override
  void initState() {
    print('initState()');
    _tabController = new TabController(
        initialIndex: 0,vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(controller: _tabController,children: <Widget>[
        new Index(),
        new CalculatorApp(),
        new WidgetDemo(),
        new Placeholder()
      ]),
      bottomNavigationBar: Material(
        color: const Color(0xFFF0EEEF), //底部导航栏主题颜色
        child: SafeArea(
          child: Container(
            height: 65.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: const Color(0xFFd0d0d0),
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                  offset: Offset(-1.0, -1.0),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Theme.of(context).primaryColor, //tab标签的下划线颜色
              // labelColor: const Color(0xFF000000),
              indicatorWeight: 3.0,
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: const Color(0xFF8E8E8E),
              tabs: <Tab>[
                Tab(text: 'Home', icon: Icon(Icons.home)),
                Tab(text: 'Message', icon: Icon(Icons.mail)),
                Tab(text: 'Profile', icon: Icon(Icons.person)),
                Tab(text: 'Profile', icon: Icon(Icons.person)),
              ],
            ),
          ),
        ),
      ),
    );
  }

}