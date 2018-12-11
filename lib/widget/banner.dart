import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../util/DimensUtils.dart' as DimenUtils;
typedef void OnBannerClickListener(int index, dynamic itemData);
typedef Widget BuildShowView(int index, dynamic itemData);

const IntegerMax = 0x7fffffff;

class BannerView extends StatefulWidget {
  final OnBannerClickListener onBannerClickListener;

  //延迟多少秒进入下一页
  final int delayTime; //秒
  //滑动需要秒数
  final int scrollTime; //毫秒
  final double height;
  final List data;


  BannerView({Key key,
    @required this.data,
    this.onBannerClickListener,
    this.delayTime = 3,
    this.scrollTime = 500,
    this.height = 200.0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new BannerViewState();
}

class BannerViewState extends State<BannerView> {
  final PageController pageController = new PageController(initialPage: 0);
  Timer timer;
  int _dataLength;

  BannerViewState() {
    print("BannerViewState");
  }

  @override
  void initState() {
    print("BannerViewState initState");
    super.initState();
    _dataLength = widget.data.length;
    resetTimer();
  }

  resetTimer() {
    clearTimer();
    timer = new Timer.periodic(
        new Duration(seconds: widget.delayTime), (Timer timer) {
      if (pageController.positions.isNotEmpty) {
        var nextPage = pageController.page.toInt() + 1;
        pageController.animateToPage(nextPage,
            duration: new Duration(milliseconds: widget.scrollTime),
            curve: Curves.linear);
      }
    });
  }

  clearTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("BannerViewState build");
    return new SizedBox(
        height: widget.height,
        child: widget.data.length == 0
            ? null
            :
        new GestureDetector(
          onTap: () {
//            print(pageController.page);
//            print(pageController.page.round());
            widget.onBannerClickListener(
                pageController.page.round() % _dataLength,
                widget.data[
                pageController.page.round() % _dataLength]);
          },
          onTapDown: (details) {
//            print('onTapDown');
            clearTimer();
          },
          onTapUp: (details) {
//            print('onTapUp');
            resetTimer();
          },
          onTapCancel: () {
            resetTimer();
          },
          child: new PageView.builder(
            controller: pageController,
            physics: const PageScrollPhysics(
                parent: const ClampingScrollPhysics()),
            itemBuilder: (BuildContext context, int index) {
              var item = widget.data[index % _dataLength];
              var imgUrl = item['imagePath'];
              var title = item['title'];
              return new BannerItem(imgUrl: imgUrl, title: title,);
            },
            itemCount: IntegerMax,
          ),
        ));
  }

  @override
  void dispose() {
    print("BannerViewState dispose");
    clearTimer();
    super.dispose();
  }
}

class BannerItem extends StatelessWidget {

  final String imgUrl;
  final String title;

  BannerItem({this.imgUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Image.network(imgUrl, fit: BoxFit.cover, width: 1000.0,),
        new Align(
          alignment: Alignment.bottomCenter,
          child: new Container(
            width: DimenUtils.getScreenWidth(context),
            color: const Color(0x50000000),
            padding: const EdgeInsets.all(5.0),
            child: new Text(title,
              style: new TextStyle(color: Colors.white, fontSize: 15.0),),
          ),
        )
      ],
    );
  }
}