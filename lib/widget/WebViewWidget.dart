import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewWidget extends StatefulWidget {

  String url;
  String title;


  WebViewWidget(@required this.url, @required this.title);

  @override
  WebViewWidgetState createState() => new WebViewWidgetState();
}

class WebViewWidgetState extends State<WebViewWidget> {

  bool isLoading = true;

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: widget.url,
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
      appBar: new AppBar(
        title: new Text(widget.title),
        iconTheme: new IconThemeData(color: Colors.white),
        bottom: new PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: isLoading
                ? new LinearProgressIndicator()
                : new Divider(
              height: 1.0,
              color: Theme
                  .of(context)
                  .primaryColor,
            )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((state) {
      if (state.type == WebViewState.finishLoad) {
        setState(() {
          isLoading = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        setState(() {
          isLoading = true;
        });
      }
    },);
  }
}