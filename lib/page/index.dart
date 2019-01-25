import 'package:flutter/material.dart';
import 'package:flutter_app/model/BannerItemBean.dart';
import 'package:flutter_app/model/IndexNewItemBean.dart';
import 'package:flutter_app/model/IndexNewsBean.dart';
import 'package:flutter_app/widget/banner.dart';

import 'package:flutter_app/http/HttpUtil.dart';
import 'package:flutter_app/http/Api.dart';

import '../widget/WebViewWidget.dart';
import '../widget/NewsListItem.dart';

class Index extends StatefulWidget {
  @override
  IndexState createState() => new IndexState();
}

class IndexState extends State<Index> with AutomaticKeepAliveClientMixin{

  BannerView _bannerView;
  List<IndexNewItemBean> listData = new List();
  var currentPage = 0;
  var countPage = 0;

  ScrollController _controller = new ScrollController();

  IndexState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels && currentPage < countPage) {
        getArtList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if(listData.length == 0) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new Scaffold(
        body: new Stack(
          children: <Widget>[
            ListView.builder(
                itemCount: listData.length + 1,
                controller: _controller,
                itemBuilder: (context,i) => buildItem(i))
          ],
        ),
      );
    }
  }

  Widget _buildLoadText() {
    return Container(child:  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text("加载中……"),
      ),
    ),);
  }

  Widget buildItem(int i) {
    if(i == 0) {
      return new Container(
        child: _bannerView,
      );
    }
    --i;
    if(i == listData.length - 1) {
      return _buildLoadText();
    } else {
      return new NewsListItem(listData[i]);
    }
  }

  @override
  void initState() {
    print("initState");
    super.initState();
    getBanner();
    getArtList();
  }


  void getArtList() {
    HttpUtil.get(Api.getIndexArtList(currentPage.toString()), (data) {
      if(data != null) {
          IndexNewsBean indexNewsBean = IndexNewsBean.fromJson(data);
          setState(() {
            listData.addAll(indexNewsBean.datas);
            currentPage = indexNewsBean.curPage;
            countPage = indexNewsBean.pageCount;
          });
      }
    });
  }

  void getBanner() {
    HttpUtil.get(Api.BANNER, (data) {
      if (data != null) {
        var list = data as List;
        List<BannerItemBean> bannerItemBeanLists = new List();
        bannerItemBeanLists = list.map((i) => BannerItemBean.fromJson(i)).toList();
        setState(() {
          _bannerView = new BannerView(
              data: bannerItemBeanLists,
              onBannerClickListener: (index, item) {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (ctx) => new WebViewWidget(item.url, item.title)
                ));
              });
        });
      }
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}