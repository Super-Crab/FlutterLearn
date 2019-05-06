import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-05-06 15:11
 */

class ImageDemo extends StatelessWidget {
  static final String sName = "ImageDemo";

  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ImageDemo'),
      ),
      body: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("images/avatar.png"),
              width: 100,
            ),
            Image.asset(
              "images/avatar.png",
              width: 100,
            ),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
            ),
            Image(
              image: AssetImage("images/avatar.png"),
              width: 100,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
            Image(
              image: AssetImage("images/avatar.png"),
              width: 100,
              height: 200,
              repeat: ImageRepeat.repeatY,
            ),
            Text(
              icons,
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.accessibility,
                  color: Colors.green,
                ),
                Icon(
                  Icons.error,
                  color: Colors.green,
                ),
                Icon(
                  Icons.fingerprint,
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
