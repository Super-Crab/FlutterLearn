import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//主题设置分为两种，全局主题和局部主题
// 通过在MaterialApp中设置ThemeData可以设置全局主题，不设置会使用默认

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appName = 'Themes';

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        brightness: Brightness.light,
        accentColor: Colors.cyan[600],
      ),
      home: MyHomePage(title: appName),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Center(
        child: Container(
          color: Theme
              .of(context)
              .accentColor,
          child: Text(
            'Text with a background color',
            style: Theme
                .of(context)
                .textTheme
                .title,
          ),
        ),
      ),
      floatingActionButton: Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.yellow),
          child: FloatingActionButton(
            onPressed: null, child: Icon(Icons.add),)),
    );
  }
}