import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-17 14:03
 */

class HeroDemo extends StatelessWidget {
  static final String sName = "HeroDemo";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(sName),
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: "avatar",
            child: ClipOval(
              child: Image.asset(
                "images/avatar.png",
                width: 50.0,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
              return new FadeTransition(
                opacity: animation,
                child: Scaffold(
                  body: new HeroDemoB(),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

class HeroDemoB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('原图'),
      ),
      body: Hero(tag: "avatar", child: Image.asset("images/avatar.png")),
    );
  }
}
