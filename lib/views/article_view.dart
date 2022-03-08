import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String postUrl, title;
  final bool light;
  ArticleView({@required this.postUrl, this.title, this.light});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  Future<void> share(dynamic postUrl, title) async {
    await FlutterShare.share(
        title: widget.title,
        text: widget.title,
        linkUrl: widget.postUrl,
        chooserTitle: "Complete Action Using");
  }

  bool isLoading;
  @override
  void initState() {
    super.initState();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.blueAccent, width: 3)),
              child: Text(
                "Stedap",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.blueAccent, width: 3)),
              child: Text(
                "News",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).accentColor)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share, color: Theme.of(context).accentColor),
              onPressed: () {
                share(widget.postUrl, widget.title);
              })
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget.postUrl,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
        ),
        isLoading
            ? Container(
                //alignment: FractionalOffset.center,
                child: Center(child: CircularProgressIndicator()),
              )
            : Container(
                //color: Colors.transparent,
                )
      ]),
    );
  }
}
