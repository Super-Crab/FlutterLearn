import 'package:flutter/material.dart';

import '../example/simple/Num.dart';

import '../model/ListRouterBean.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-04-28 13:57
 */
class WidgetDemo extends StatefulWidget {
  @override
  WidgetDemoState createState() => new WidgetDemoState();
}

class WidgetDemoState extends State<WidgetDemo> {
  List<ListRouterBean> listData = new List();

  @override
  void initState() {
    listData.add(new ListRouterBean(NumPage.sName, new NumPage()));
    listData.add(new ListRouterBean(NumPage.sName, new NumPage()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('WidgetDemo'),
      ),
      body: new Stack(
        children: <Widget>[
          ListView.builder(
            itemBuilder: (context, i) => buildItem(i),
            itemCount: listData.length,
          ),
        ],
      ),
    );
  }

  buildItem(int i) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return listData[i].widget;
        }));
      },
      child: Container(
        child: Column(
          children: <Widget>[
            new Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    listData[i].name,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            new Divider()
          ],
        ),
        alignment: Alignment.center,
        height: 50,
      ),
    );
  }
}
