import 'package:flutter/material.dart';
//import 'package:timeago/timeago.dart' as time;
import 'constant.dart';


class DetailedNewws extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl, author;
  final DateTime timeago;

  DetailedNewws(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      this.timeago,
      this.author,
      @required this.posturl});

  void choiceActions(String choice) {
    if (choice == Constants.Savetoplaylist) {
      print('Save To watch Later');
    } else if (choice == Constants.Share) {
      print('Share');
      //share(posturl, title, content);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: Container(
          margin: EdgeInsets.only(bottom: 24, top: 10),
          width: double.infinity,//MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              //alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 260,
                        child: Text(
                          title,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      PopupMenuButton<String>(
                        color: Colors.white,
                        onSelected: choiceActions,
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
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    //width: 260,
                    child: Text(
                      content,
                      maxLines: 250,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   child: Text(
                      //     "Published " + time.format(this.timeago),
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: TextStyle(color: Colors.black54, fontSize: 14),
                      //   ),
                      // ),
                      Container(
                        width: 160,
                        child: Text(
                          author,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 2)
                ],
              ),
            ),
          )),
      
    );
  }
}


