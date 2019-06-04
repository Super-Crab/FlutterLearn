import 'package:flutter/material.dart';

/**
 * Description:
 * Author:          peixuan.xie
 * Time:            2019-06-04 18:11
 */

class GridViewDemo extends StatefulWidget {
  static final String sName = "GridViewDemo";

  @override
  GridViewDemoState createState() => new GridViewDemoState();
}

class GridViewDemoState extends State<GridViewDemo> {
  List<IconData> _icons = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(GridViewDemo.sName),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 1.0),
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            if (index == _icons.length - 1 && _icons.length < 200) {
              _retrieveIcons();
            }
            return Icon(_icons[index]);
          }),
    );
  }

  @override
  void initState() {
    _retrieveIcons();
  }

  void _retrieveIcons() {
    Future.delayed(Duration(microseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
