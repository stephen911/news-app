import 'package:flutter/material.dart';
import 'package:news_app_api/helper/data.dart';
import 'package:news_app_api/helper/news.dart';
import 'package:news_app_api/helper/widgets.dart';
import 'package:news_app_api/models/categorie_model.dart';
import 'loading.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;
  final String country;
  final bool light;

 const CategoryNews({this.newsCategory, this.country, this.light});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newslist;
  bool _loading = true;
  List<CategorieModel> categories = <CategorieModel>[];

  @override
  void initState() {
    getNews(widget.country);
    // TODO: implement initState
    super.initState();
  }

  // void showInSnackBar(String value) {
  //   Scaffold.of(context).showSnackBar(new SnackBar(
  //     content: new Text(value),
  //     backgroundColor: Colors.blueAccent,
  //     //duration: Duration(seconds: 15),
  //     action: SnackBarAction(
  //         label: "Refresh Again",
  //         onPressed: () {
  //           categories = getCategories();
  //           getNews(country);
  //           print("refreshed");
  //         }),
  //   ));
  // }

  void getNews(String country) async {
    final NewsForCategorie news = NewsForCategorie();
    await news.getNewsForCategory(widget.newsCategory, widget.country);
    newslist = news.news;
    // print(newslist);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  // shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.blueAccent, width: 3)),
              child: const Text(
                "Stedap",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding:const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  // shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.blueAccent, width: 3)),
              child: const Text(
                "News",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 5),
            padding: const EdgeInsets.all(3),
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
                // shape: BoxShape.rectangle,
                border: Border.all(color: Colors.blueAccent, width: 3)),
            child: Center(
              child: Text(
                (() {
                      if (widget.country == "us") {
                        return "United States";
                      } else if (widget.country == "ar") {
                        return "Argentina";
                      } else if (widget.country == "au") {
                        return "Australia";
                      } else if (widget.country == "at") {
                        return "Austria";
                      } else if (widget.country == "be") {
                        return "Belgium";
                      } else if (widget.country == "br") {
                        return "Brazil";
                      } else if (widget.country == "bg") {
                        return "Bulgaria";
                      } else if (widget.country == "ca") {
                        return "Canada";
                      } else if (widget.country == "cn") {
                        return "China";
                      } else if (widget.country == "co") {
                        return "Colombia";
                      } else if (widget.country == "cu") {
                        return "Cuba";
                      } else if (widget.country == "cz") {
                        return "Czech Republic";
                      } else if (widget.country == "eg") {
                        return "Egypt";
                      } else if (widget.country == "fr") {
                        return "France";
                      } else if (widget.country == "de") {
                        return "Germany";
                      } else if (widget.country == "gr") {
                        return "Greece";
                      } else if (widget.country == "hk") {
                        return "Hong Kong";
                      } else if (widget.country == "hu") {
                        return "Hungary";
                      } else if (widget.country == "in") {
                        return "India";
                      } else if (widget.country == "id") {
                        return "Indonesia";
                      } else if (widget.country == "ie") {
                        return "Ireland";
                      } else if (widget.country == "il") {
                        return "Israel";
                      } else if (widget.country == "it") {
                        return "Italy";
                      } else if (widget.country == "jp") {
                        return "Japan";
                      } else if (widget.country == "lv") {
                        return "Latvia";
                      } else if (widget.country == "lt") {
                        return "Lithuania";
                      } else if (widget.country == "my") {
                        return "Malaysia";
                      } else if (widget.country == "mx") {
                        return "Mexico";
                      } else if (widget.country == "ma") {
                        return "Morocco";
                      } else if (widget.country == "nl") {
                        return "Netherlands";
                      } else if (widget.country == "nz") {
                        return "New Zealand";
                      } else if (widget.country == "ng") {
                        return "Nigeria";
                      } else if (widget.country == "no") {
                        return "Norway";
                      } else if (widget.country == "ph") {
                        return "Philippines";
                      } else if (widget.country == "pl") {
                        return "Poland";
                      } else if (widget.country == "pt") {
                        return "Portugal";
                      } else if (widget.country == "ro") {
                        return "Romania";
                      } else if (widget.country == "ru") {
                        return "Russia";
                      } else if (widget.country == "sa") {
                        return "Saudi Arabia";
                      } else if (widget.country == "rs") {
                        return "Serbia";
                      } else if (widget.country == "sg") {
                        return "Singapore";
                      } else if (widget.country == "sk") {
                        return "Slovakia";
                      } else if (widget.country == "si") {
                        return "Slovenia";
                      } else if (widget.country == "za") {
                        return "South Africa";
                      } else if (widget.country == "kr") {
                        return "South Korea";
                      } else if (widget.country == "se") {
                        return "Sweden";
                      } else if (widget.country == "ch") {
                        return "Switzerland";
                      } else if (widget.country == "tw") {
                        return "Taiwan";
                      } else if (widget.country == "th") {
                        return "Thailand";
                      } else if (widget.country == "tr") {
                        return "Turkey";
                      } else if (widget.country == "ae") {
                        return "UAE";
                      } else if (widget.country == "ua") {
                        return "Ukraine";
                      } else if (widget.country == "gb") {
                        return "United Kingdom";
                      } else if (widget.country == "us") {
                        return "United States";
                      } else if (widget.country == "ve") {
                        return "Venuzuela";
                      } else {
                        return widget.country;
                      }
                    })()
                        .toUpperCase() +
                    "'S ${widget.newsCategory.toUpperCase()}" +
                    " NEWS",
                style:const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).accentColor)),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              icon: Icon(
                Icons.refresh,
                color: widget.light ? Colors.blueAccent : Theme.of(context).accentColor,
              ),
              onPressed: () {
                // print("refreshed");
                categories = getCategories();
                getNews(widget.country);
                //showInSnackBar("Page Refreshed");
              },
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _loading
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  GlobalLoading(
                    light: widget.light,
                  ),
                  const SizedBox(height: 20),
                  const Center(child: CircularProgressIndicator()),
                ],
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Container(
                  //   width: double.infinity,
                  //   padding: EdgeInsets.all(3),
                  //   decoration: BoxDecoration(
                  //       color: Colors.blueAccent,
                  //       shape: BoxShape.rectangle,
                  //       border:
                  //           Border.all(color: Colors.blueAccent, width: 3)),
                  //   child: Center(
                  //     child: Text(
                  //       (() {
                  //             if (widget.country == "us") {
                  //               return "United States";
                  //             } else if (widget.country == "ar") {
                  //               return "Argentina";
                  //             } else if (widget.country == "au") {
                  //               return "Australia";
                  //             } else if (widget.country == "at") {
                  //               return "Austria";
                  //             } else if (widget.country == "be") {
                  //               return "Belgium";
                  //             } else if (widget.country == "br") {
                  //               return "Brazil";
                  //             } else if (widget.country == "bg") {
                  //               return "Bulgaria";
                  //             } else if (widget.country == "ca") {
                  //               return "Canada";
                  //             } else if (widget.country == "cn") {
                  //               return "China";
                  //             } else if (widget.country == "co") {
                  //               return "Colombia";
                  //             } else if (widget.country == "cu") {
                  //               return "Cuba";
                  //             } else if (widget.country == "cz") {
                  //               return "Czech Republic";
                  //             } else if (widget.country == "eg") {
                  //               return "Egypt";
                  //             } else if (widget.country == "fr") {
                  //               return "France";
                  //             } else if (widget.country == "de") {
                  //               return "Germany";
                  //             } else if (widget.country == "gr") {
                  //               return "Greece";
                  //             } else if (widget.country == "hk") {
                  //               return "Hong Kong";
                  //             } else if (widget.country == "hu") {
                  //               return "Hungary";
                  //             } else if (widget.country == "in") {
                  //               return "India";
                  //             } else if (widget.country == "id") {
                  //               return "Indonesia";
                  //             } else if (widget.country == "ie") {
                  //               return "Ireland";
                  //             } else if (widget.country == "il") {
                  //               return "Israel";
                  //             } else if (widget.country == "it") {
                  //               return "Italy";
                  //             } else if (widget.country == "jp") {
                  //               return "Japan";
                  //             } else if (widget.country == "lv") {
                  //               return "Latvia";
                  //             } else if (widget.country == "lt") {
                  //               return "Lithuania";
                  //             } else if (widget.country == "my") {
                  //               return "Malaysia";
                  //             } else if (widget.country == "mx") {
                  //               return "Mexico";
                  //             } else if (widget.country == "ma") {
                  //               return "Morocco";
                  //             } else if (widget.country == "nl") {
                  //               return "Netherlands";
                  //             } else if (widget.country == "nz") {
                  //               return "New Zealand";
                  //             } else if (widget.country == "ng") {
                  //               return "Nigeria";
                  //             } else if (widget.country == "no") {
                  //               return "Norway";
                  //             } else if (widget.country == "ph") {
                  //               return "Philippines";
                  //             } else if (widget.country == "pl") {
                  //               return "Poland";
                  //             } else if (widget.country == "pt") {
                  //               return "Portugal";
                  //             } else if (widget.country == "ro") {
                  //               return "Romania";
                  //             } else if (widget.country == "ru") {
                  //               return "Russia";
                  //             } else if (widget.country == "sa") {
                  //               return "Saudi Arabia";
                  //             } else if (widget.country == "rs") {
                  //               return "Serbia";
                  //             } else if (widget.country == "sg") {
                  //               return "Singapore";
                  //             } else if (widget.country == "sk") {
                  //               return "Slovakia";
                  //             } else if (widget.country == "si") {
                  //               return "Slovenia";
                  //             } else if (widget.country == "za") {
                  //               return "South Africa";
                  //             } else if (widget.country == "kr") {
                  //               return "South Korea";
                  //             } else if (widget.country == "se") {
                  //               return "Sweden";
                  //             } else if (widget.country == "ch") {
                  //               return "Switzerland";
                  //             } else if (widget.country == "tw") {
                  //               return "Taiwan";
                  //             } else if (widget.country == "th") {
                  //               return "Thailand";
                  //             } else if (widget.country == "tr") {
                  //               return "Turkey";
                  //             } else if (widget.country == "ae") {
                  //               return "UAE";
                  //             } else if (widget.country == "ua") {
                  //               return "Ukraine";
                  //             } else if (widget.country == "gb") {
                  //               return "United Kingdom";
                  //             } else if (widget.country == "us") {
                  //               return "United States";
                  //             } else if (widget.country == "ve") {
                  //               return "Venuzuela";
                  //             } else {
                  //               return widget.country;
                  //             }
                  //           })()
                  //               .toUpperCase() +
                  //           "'S ${widget.newsCategory.toUpperCase()}" +
                  //           " NEWS",
                  //       style: TextStyle(
                  //           color: Colors.white, fontWeight: FontWeight.w600),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: ListView.builder(
                        itemCount: newslist.length,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NewsTile(
                              imgUrl: newslist[index].urlToImage ?? "",
                              title: newslist[index].title ?? "",
                              desc: newslist[index].description ?? "",
                              content: newslist[index].content ?? "",
                              posturl: newslist[index].articleUrl ?? "",
                              timeago: newslist[index].publshedAt,
                              author: newslist[index].author ?? "",
                              light: widget.light);
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
