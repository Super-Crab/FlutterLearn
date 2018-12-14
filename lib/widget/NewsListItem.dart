import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/IndexNewItemBean.dart';
import '../widget/WebViewWidget.dart';

class NewsListItem extends StatefulWidget {
  IndexNewItemBean itemData;

  NewsListItem(@required this.itemData) : assert(itemData != null);

  @override
  _NewsListItemState createState() => _NewsListItemState();
}

class _NewsListItemState extends State<NewsListItem> {
  @override
  Widget build(BuildContext context) {
    Row row1 = new Row(
      children: <Widget>[
        Expanded(
            child: Row(
              children: <Widget>[
                Text('author : '),
                Text(
                  widget.itemData.author,
                  style: new TextStyle(color: Theme
                      .of(context)
                      .accentColor),
                ),
              ],
            )),
        Text(widget.itemData.niceDate)
      ],
    );

    Row title = new Row(
      children: <Widget>[
        new Expanded(
          child: Text(
            widget.itemData.title,
            style: new TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        )
      ],
    );

    Row row2 = new Row(children: <Widget>[
      new Expanded(
        child: Text(
          widget.itemData.superChapterName,
          style: new TextStyle(color: Theme
              .of(context)
              .accentColor),
        ),
      )
    ]);

    return GestureDetector(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                child: row1,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                child: title,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                child: row2,
              ),
              Divider()
            ],
          ),
        ),
        onTap: (){
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (ctx) =>
              new WebViewWidget(widget.itemData.link, widget.itemData.title)
          ));
        }
    );
  }
}
