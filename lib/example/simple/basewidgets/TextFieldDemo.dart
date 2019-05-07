import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-05-07 10:05
 */

class TextFieldDemo extends StatefulWidget {
  static final String sName = "TextFieldAndFormDemo";

  @override
  TextFieldDemoState createState() => new TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TextFieldAndFormDemo'),
      ),
      body: new Theme(
        data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200],
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.grey),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0))),
        child: new Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
              controller: _controller,
              onChanged: (v) {
                print("onChange: $v");
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            )
          ],
        ),
      ),
    );
  }
}
