import 'package:flutter/material.dart';
import 'package:flutter_app/widget/banner.dart';

import 'package:flutter_app/http/HttpUtil.dart';
import 'package:flutter_app/http/Api.dart';

import '../widget/WebViewWidget.dart';
import '../widget/ToolBar.dart';

class Index extends StatefulWidget {
  @override
  IndexState createState() => new IndexState();
}

class IndexState extends State<Index> {

  BannerView _bannerView;
  var bannerData;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          _bannerView,
          new Align(
            alignment: FractionalOffset.topRight,
            child: new Container(
              width: 1000.0,
              color: const Color(0x50000000),
              padding: const EdgeInsets.all(25.0),
              child: new ToolBar(),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getBanner();
  }

  void getBanner() {
    HttpUtil.get(Api.BANNER, (data) {
      if (data != null) {
        setState(() {
          bannerData = data;
          _bannerView = new BannerView(
              data: bannerData,
              onBannerClickListener: (index, data) {
                var imgUrl = data['url'];
                var title = data['title'];
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (ctx) => new WebViewWidget(imgUrl,title)
                ));
              });
        });
      }
    });
  }
}