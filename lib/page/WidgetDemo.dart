import 'package:flutter/material.dart';

import '../example/simple/Num.dart';
import '../example/simple/LifeCyclePage.dart';
import '../example/simple/StateA.dart';
import '../example/simple/StateB.dart';
import '../example/simple/StateC.dart';
import '../example/simple/basewidgets/TextDemo.dart';
import '../example/simple/basewidgets/ButtonDemo.dart';
import '../example/simple/basewidgets/ImageDemo.dart';
import '../example/simple/basewidgets/SwitchAndCheckBoxDemo.dart';
import '../example/simple/basewidgets/TextFieldDemo.dart';
import '../example/simple/basewidgets/FormDemo.dart';

import '../example/simple/layoutwidgets/RowAndColumnDemo.dart';
import '../example/simple/layoutwidgets/FlexDemo.dart';
import '../example/simple/layoutwidgets/WrapAndFlowDemo.dart';
import '../example/simple/layoutwidgets/StackAndPositionedDemo.dart';

import '../example/simple/containerwidgets/PaddingDemo.dart';
import '../example/simple/containerwidgets/DecoratedBoxDemo.dart';
import '../example/simple/containerwidgets/TransformDemo.dart';
import '../example/simple/containerwidgets/ContainerDemo.dart';

import '../example/simple/scrollablewidgets/SingleChildScrollViewDemo.dart';
import '../example/simple/scrollablewidgets/GridViewDemo.dart';
import '../example/simple/scrollablewidgets/CustomScrollViewDemo.dart';

import '../util/DimensUtils.dart' as DimensUtils;
/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-04-28 13:57
 */
class WidgetDemo extends StatefulWidget {
  @override
  WidgetDemoState createState() => new WidgetDemoState();
}

class ListRouterBean {
  String name;
  Widget widget;
  List<ListRouterBean> children;

  ListRouterBean(this.name, this.widget,
      [this.children = const <ListRouterBean>[]]);
}

final List<ListRouterBean> listData = new List();


class WidgetDemoState extends State<WidgetDemo> {

  @override
  void initState() {
    listData.clear();
    listData.add(new ListRouterBean("Simple", null, [
      new ListRouterBean(NumPage.sName, new NumPage(), []),
    ]));
    listData.add(new ListRouterBean("基础Widgets", null, [
      new ListRouterBean(LifeCyclePage.sName, new LifeCyclePage(), []),
      new ListRouterBean(StateA.sName, new StateA(), []),
      new ListRouterBean(StateB.sName, new StateB(), []),
      new ListRouterBean(StateC.sName, new StateC(), []),
      new ListRouterBean(TextDemo.sName, new TextDemo(), []),
      new ListRouterBean(ButtonDemo.sName, new ButtonDemo(), []),
      new ListRouterBean(ImageDemo.sName, new ImageDemo(), []),
      new ListRouterBean(SwitchAndCheckBoxDemo.sName, new SwitchAndCheckBoxDemo(), []),
      new ListRouterBean(TextFieldDemo.sName, new TextFieldDemo(), []),
      new ListRouterBean(FormDemo.sName, new FormDemo(), []),
    ]));
    listData.add(new ListRouterBean("LayoutWidgets", null, [
      new ListRouterBean(RowAndColumnDemo.sName, new RowAndColumnDemo(), []),
      new ListRouterBean(FlexDemo.sName, new FlexDemo(), []),
      new ListRouterBean(WrapAndFlowDemo.sName, new WrapAndFlowDemo(), []),
      new ListRouterBean(StackAndPositionedDemo.sName, new StackAndPositionedDemo(), []),
    ]));
    listData.add(new ListRouterBean("ContainerWidgets", null, [
      new ListRouterBean(PaddingDemo.sName, new PaddingDemo(), []),
      new ListRouterBean(DecoratedBoxDemo.sName, new DecoratedBoxDemo(), []),
      new ListRouterBean(TransformDemo.sName, new TransformDemo(), []),
      new ListRouterBean(ContainerDemo.sName, new ContainerDemo(), []),
    ]));
    listData.add(new ListRouterBean("scrollablewidgets", null, [
      new ListRouterBean(SingleChildScrollViewDemo.sName, new SingleChildScrollViewDemo(), []),
      new ListRouterBean(GridViewDemo.sName, new GridViewDemo(), []),
      new ListRouterBean(CustomScrollViewDemo.sName, new CustomScrollViewDemo(), []),
    ]));
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
            itemBuilder: (context, i) => new ListRouterItem(context,listData[i]),
            itemCount: listData.length,
          ),
        ],
      ),
    );
  }

}

class ListRouterItem extends StatelessWidget {

  final ListRouterBean _listRouterBean;

  final BuildContext _buildContext;

  const ListRouterItem(this._buildContext,this._listRouterBean);

  Widget _buildTiles(ListRouterBean root) {
    if (root.children.isEmpty)
      return new GestureDetector(
        onTap: () {
          Navigator.push(_buildContext, new MaterialPageRoute(builder: (_buildContext) {
            return root.widget;
          }));
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: Container(
                        child: new Text(
                          root.name,
                          textAlign: TextAlign.center,
                        ),
                        height: 50,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          height: 50,
        ),
      );

    return new ExpansionTile(
      title: new Text(root.name),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(_listRouterBean);
  }
}
