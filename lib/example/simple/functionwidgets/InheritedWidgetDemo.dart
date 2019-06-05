import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-05 16:10
 */

class InheritedWidgetDemo extends StatefulWidget {
  static final String sName = "InheritedWidgetDemo";
  @override
  InheritedWidgetDemoState createState() => new InheritedWidgetDemoState();
}

class InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(),
              ),
              RaisedButton(
                child: Text("Increment"),
                onPressed: () => setState(() => ++count),
              )
            ],
          )),
    );
  }
}

class _TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => new _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({
    @required this.data,
    @required Widget child,
  }) : super(child: child);

  final int data;

  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget)
        as ShareDataWidget;
  }

  @override
  bool updateShouldNotify(ShareDataWidget old) {
    return old.data != data;
  }
}
