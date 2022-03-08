import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_api/helper/constant.dart';
import 'package:news_app_api/helper/data.dart';
import 'package:news_app_api/helper/widgets.dart';
import 'package:news_app_api/models/categorie_model.dart';
import 'package:news_app_api/views/categorie_news.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import '../aboutUs.dart';
import '../helper/news.dart';
import 'countrydropdown.dart';
import 'loading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategorieModel> categories = <CategorieModel>[];
  String country = "us";
  bool light = true;
  var newslist;

  bool _loading;
  // Box currentTheme;

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    categories = getCategories();
    getNews(country);
  }

  // var currentTheme1 = Hive.box("theme");
  Box currentTheme = Hive.box("theme");
  Box currentCountry = Hive.box("country");

  void changeTheme() {
    if (light == true) {
      light = false;
      currentTheme.put("light", light);
    } else {
      light = true;
      currentTheme.put("light", light);
    }
  }

  // ignore: always_declare_return_types
  // ignore: type_annotate_public_apis
   void launchUrl(String url) async {
    if (await url_launcher.canLaunch(url)) {
      await url_launcher.launch(url);
    } else {
      // print("failed");
      throw "Couldn't launch $url";
    }
  }

  void choiceAction(String choice) {
    if (choice == Constants.Savetoplaylist) {
      // print('Save To watch Later');
    }
    // else if (choice == Constants.Pause) {
    //   print('pause');
    // }
    else if (choice == Constants.Share) {
      // print('Share');
      //share(posturl, title, context);
    }
    // else if (choice == Constants.Delete) {
    //   print('Delete');
    // }
    // else if (choice == Constants.NotInterested) {
    //   print('Not Interested');
    // }
    else if (choice == Constants.Dontrecommend) {
      // print('Dont recommend Channel');
    } else if (choice == Constants.AboutUs) {
      // print('About Us');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AboutUs()));
    } else if (choice == Constants.Privacy) {
      // print('privacy');
      const url = "http://www.stedap1.site.live";
      launchUrl(url);
    }
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
  //           getNews();
  //           print("refreshed");
  //         }),
  //   ));
  // }

  void getNews(String country) async {
    News news = News();
    await news.getNews(country);
    newslist = news.news;
    // final newslist2 = newslist;
    // print(newslist2);
    setState(() {
      _loading = false;
    });
  }

  void call() {
    url_launcher.launch("tel:+233275846911");
  }

  void mail() {
    url_launcher.launch("mailto:stephendappah1@gmail.com");
  }

  @override
  Widget build(BuildContext context) {
    if (currentTheme.get("light") == null) {
      light = true;
    } else {
      light = currentTheme.get("light");
    }

    if (currentCountry.get("country") == null) {
      country = "us";
    } else {
      country = currentCountry.get("country");
    }
    // print(light);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: light ? Colors.grey : Colors.grey),
        actions: [
          GestureDetector(
            onTap: () {
              AdaptiveTheme.of(context).toggleThemeMode();
              changeTheme();
            },
            child: Icon(light ? Icons.brightness_2 : Icons.wb_sunny),
          ),
          IconButton(
              icon: const Icon(
                Icons.refresh,
              ), // color: Colors.grey,),
              onPressed: () {
                //showInSnackBar("Page Refreshed");
                // print("refresh");
                categories = getCategories();
                getNews(country);
                //print(getNews(this.country));
                // print(country);
              }),
          PopupMenuButton<String>(
            //color: Colors.grey,
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  textStyle: TextStyle(
                      color: light ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        centerTitle: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
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
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  // shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.blueAccent, width: 3)),
              child: const Text(
                "News",
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        imageAssetUrl: categories[index].imageAssetUrl,
                        categoryName: categories[index].categorieName,
                        country: country,
                        light: light,
                      );
                    }),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 2),
                      padding: const EdgeInsets.all(7),
                      height: 40,
                      //width: 130,
                      decoration:const  BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(6),
                              topRight: Radius.circular(6))),
                      child: const Text(
                        "Top Stories",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      )),

                  // Container(
                  //     margin: EdgeInsets.only(top: 2),
                  //     padding: EdgeInsets.all(7),
                  //     //width: 130,
                  //     decoration: BoxDecoration(
                  //         color: Colors.red,
                  //         borderRadius: BorderRadius.only(
                  //             bottomLeft: Radius.circular(6),
                  //             topLeft: Radius.circular(6))),
                  //     child: Text(
                  //       "Country",
                  //       style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.w900,
                  //           fontSize: 20),
                  //     )),
                  CountryDropdown(
                      countries:const  [
                        'ar',
                        'au',
                        'at',
                        'be',
                        'br',
                        'bg',
                        'ca',
                        'cn',
                        'co',
                        'cu',
                        'cz',
                        'eg',
                        'fr',
                        'de',
                        'gr',
                        'hk',
                        'hu',
                        'in',
                        'id',
                        'ie',
                        'il',
                        'it',
                        'jp',
                        'lv',
                        'lt',
                        'my',
                        'mx',
                        'ma',
                        'nl',
                        'nz',
                        'ng',
                        'no',
                        'ph',
                        'pl',
                        'pt',
                        'ro',
                        'ru',
                        'sa',
                        'rs',
                        'sg',
                        'sk',
                        'si',
                        'za',
                        'kr',
                        'se',
                        'ch',
                        'tw',
                        'th',
                        'tr',
                        'ae',
                        'ua',
                        'gb',
                        'us',
                        've'
                      ],
                      country: country,
                      onChanged: (val) {
                        setState(() {
                          country = val;
                          currentCountry.put("country", val);
                          categories = getCategories();
                          getNews(this.country);
                          print(country);
                        });
                      }),
                ],
              ),
              const SizedBox(height: 8)
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: light ? Image.asset("assets/images/stedapnewsicon.png")
                            .image : Image.asset("assets/images/stedapnewsicondark.png")
                            .image,
                        fit: BoxFit.cover)),
                child: const Opacity(
                  opacity: 0.0,
                  child: Text(
                    "Stedap News",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      //color: Colors.blue,
                    ),
                  ),
                )),
            ListTile(
              title: const Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              leading: const Icon(Icons.home, color: Colors.blueAccent),
              onTap: () {
                // print("home");
                Navigator.pop(context);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
                title:const Text(
                  "Send Us a mail",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                leading: const Icon(Icons.mail, color: Colors.blueAccent),
                onTap: () {
                  // print("mail");
                  mail();
                  Navigator.pop(context);
                }),
            // ListTile(
            //     title: Text("Send Us a message"),
            //     leading: Icon(Icons.message, color: Colors.blueAccent),
            //     onTap: () {
            //       print("message");
            //       Navigator.pop(context);
            //     }),

            ListTile(
                title: const Text(
                  "Visit Us",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                leading: const Icon(Icons.explore, color: Colors.blueAccent),
                onTap: () {
                  // print("visit");
                  mail();
                  Navigator.pop(context);
                  const url = "http://www.stedap1.site.live";
                  launchUrl(url);
                }),
            ListTile(
                title: const Text(
                  "Call Us",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                leading: const Icon(Icons.call, color: Colors.blueAccent),
                onTap: () {
                  // print("Call Made");
                  call();
                  Navigator.pop(context);
                }),
            ListTile(
                title: const Text(
                  "Close",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                leading: const Icon(Icons.exit_to_app, color: Colors.blueAccent),
                onTap: () {
                  // print("add people");
                  Navigator.pop(context);
                })
          ],
        ),
      ),
      body: SafeArea(
        child: _loading
            ? SingleChildScrollView(
                physics:const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    GlobalLoading(
                      light: light,
                    ),
                   const SizedBox(height: 20),
                   const Center(child: CircularProgressIndicator()),
                  ],
                ),
              )
            : SingleChildScrollView(
                physics:const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// Categories
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 16),
                    //   height: 70,
                    //   child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       itemCount: categories.length,
                    //       itemBuilder: (context, index) {
                    //         return CategoryCard(
                    //           imageAssetUrl: categories[index].imageAssetUrl,
                    //           categoryName: categories[index].categorieName,
                    //           country: this.country,
                    //         );
                    //       }),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Container(
                    //         margin: EdgeInsets.only(top: 2),
                    //         padding: EdgeInsets.all(7),
                    //         //width: 130,
                    //         decoration: BoxDecoration(
                    //             color: Colors.red,
                    //             borderRadius: BorderRadius.only(
                    //                 bottomRight: Radius.circular(6),
                    //                 topRight: Radius.circular(6))),
                    //         child: Text(
                    //           "Top Stories",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.w900,
                    //               fontSize: 20),
                    //         )),
                    //     // Container(
                    //     //     margin: EdgeInsets.only(top: 2),
                    //     //     padding: EdgeInsets.all(7),
                    //     //     //width: 130,
                    //     //     decoration: BoxDecoration(
                    //     //         color: Colors.red,
                    //     //         borderRadius: BorderRadius.only(
                    //     //             bottomLeft: Radius.circular(6),
                    //     //             topLeft: Radius.circular(6))),
                    //     //     child: Text(
                    //     //       "Country",
                    //     //       style: TextStyle(
                    //     //           color: Colors.white,
                    //     //           fontWeight: FontWeight.w900,
                    //     //           fontSize: 20),
                    //     //     )),
                    //     CountryDropdown(
                    //         countries: [
                    //           'ar',
                    //           'au',
                    //           'at',
                    //           'be',
                    //           'br',
                    //           'bg',
                    //           'ca',
                    //           'cn',
                    //           'co',
                    //           'cu',
                    //           'cz',
                    //           'eg',
                    //           'fr',
                    //           'de',
                    //           'gr',
                    //           'hk',
                    //           'hu',
                    //           'in',
                    //           'id',
                    //           'ie',
                    //           'il',
                    //           'it',
                    //           'jp',
                    //           'lv',
                    //           'lt',
                    //           'my',
                    //           'mx',
                    //           'ma',
                    //           'nl',
                    //           'nz',
                    //           'ng',
                    //           'no',
                    //           'ph',
                    //           'pl',
                    //           'pt',
                    //           'ro',
                    //           'ru',
                    //           'sa',
                    //           'rs',
                    //           'sg',
                    //           'sk',
                    //           'si',
                    //           'za',
                    //           'kr',
                    //           'se',
                    //           'ch',
                    //           'tw',
                    //           'th',
                    //           'tr',
                    //           'ae',
                    //           'ua',
                    //           'gb',
                    //           'us',
                    //           've'
                    //         ],
                    //         country: country,
                    //         onChanged: (val) {
                    //           setState(() {
                    //             country = val;
                    //             categories = getCategories();
                    //             getNews(this.country);
                    //             print(country);
                    //           });
                    //         }),
                    //   ],
                    // ),

                    /// News Article
                    Container(
                      margin: EdgeInsets.only(top: 16),
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
                              timeago: newslist[index].publshedAt ?? "",
                              author: newslist[index].author ?? "",
                              light: light,
                            );
                          }),
                    ),
                    //   Center(child: Container(child: Text("End of Stories", style: TextStyle(
                    // color: Colors.red,
                    // fontSize: 17,
                    // fontWeight: FontWeight.w500),))),
                  ],
                ),
              ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {this.imageAssetUrl, this.categoryName, this.country, this.light});

  final String imageAssetUrl, categoryName, country;
  final bool light;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      newsCategory: categoryName.toLowerCase(),
                      country: country,
                      light: light,
                    )));
      },
      child: Container(
        margin:const EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                fadeInCurve: Curves.bounceInOut,
                imageUrl: imageAssetUrl,
                // imageBuilder: (context, imageProvider) {
                //   return new Container(
                //     decoration: BoxDecoration(
                //         image: DecorationImage(
                //             image: imageProvider, fit: BoxFit.cover)),
                //   );
                // },
                placeholder: (_, url) {
                  // return Center(
                  //     widthFactor: 3.5, child: new CircularProgressIndicator());
                },
                errorWidget: (context, url, error) {
                  // return Center(widthFactor: 1.5, child: new Icon(Icons.error, color: Colors.grey));
                },
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style:const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
