import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
//import 'package:news_app_api/helper/detailednews.dart';
import 'package:news_app_api/views/article_view.dart';
import 'package:shimmer/shimmer.dart';
import 'constant.dart';
import 'package:timeago/timeago.dart' as time;

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl, author;
  final bool light;
  final DateTime timeago;

  NewsTile(
      {this.imgUrl,
      this.light,
      this.desc,
      this.title,
      this.content,
      this.timeago,
      this.author,
      @required this.posturl});

  Future<void> share(dynamic desc, title, content) async {
    await FlutterShare.share(
        title: desc,
        text: title,
        linkUrl: posturl,
        chooserTitle: "Complete Action Using");
  }

  void choiceActions(String choice) {
    if (choice == NewsConstants.Share) {
      print('Share');
      share(posturl, title, content);
    } else if (choice == NewsConstants.ReadLater) {
      print('Save To Read Later');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: posturl,
                      title: title,
                    )));
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => DetailedNewws(
        //               posturl: posturl, imgUrl: imgUrl, title: title, content: content, author: author,
        //             )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 21, right: 10, left: 10),
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: light ? Colors.white : Theme.of(context).accentColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 0), color: Colors.black26, blurRadius: 15),
            ],
          ),
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                        errorBuilder: (context, object, stacktrace) {
                          return new Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: Shimmer.fromColors(
                              baseColor: light ? Colors.white : Theme.of(context).accentColor,
                              highlightColor:light ? Colors.grey[200] : Colors.black38,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    height: 200,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            desc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14),
                          ),
                        ),
                      ),
                      PopupMenuButton<String>(
                        //color: Colors.white,
                        onSelected: choiceActions,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (BuildContext context) {
                          return Constants.choices.map((String choice) {
                            return PopupMenuItem<String>(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Published " + time.format(this.timeago),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 160,
                      //   child: Text(
                      //     author,
                      //     maxLines: 1,
                      //     overflow: TextOverflow.ellipsis,
                      //     textAlign: TextAlign.right,
                      //     style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 11)
                  // Divider(thickness: 2)
                ],
              ),
            ),
          )),
    );
  }
}
