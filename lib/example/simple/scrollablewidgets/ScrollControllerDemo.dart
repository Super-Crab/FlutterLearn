import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-05 11:27
 */

class ScrollControllerDemo extends StatefulWidget {
  static final String sName = "ScrollControllerDemo";

  @override
  ScrollControllerDemoState createState() => new ScrollControllerDemoState();
}

class ScrollControllerDemoState extends State<ScrollControllerDemo> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示 "返回到顶部"按钮

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('滚动控制'),
      ),
      body: new Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 50.0,
          controller: _controller,
          itemBuilder: (context, index) {
            return ListTile(title: Text("$index"));
          },
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }

  @override
  void initState() {
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
