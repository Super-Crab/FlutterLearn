import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-05 16:56
 */
class ThemeDataDemo extends StatefulWidget {
  static final String sName = "ThemeDataDemo";

  @override
  ThemeDataDemoState createState() => new ThemeDataDemoState();
}

class ThemeDataDemoState extends State<ThemeDataDemo> {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primaryColor: _themeColor,
          iconTheme: IconThemeData(color: _themeColor)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("主题测试"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Icon(Icons.favorite),
              Icon(Icons.airport_shuttle),
              Text("  颜色跟随主题")
            ]),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色固定黑色")
                  ]),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _themeColor =
              _themeColor == Colors.teal ? Colors.blue : Colors.teal),
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}
