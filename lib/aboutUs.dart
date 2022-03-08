import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: Info(),
    );///
  }
}

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              //height: 150,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(9),
              decoration: BoxDecoration(
                //gradient: LinearGradient(colors: [Colors.green, Colors.red, Colors.yellow, Colors.lightBlue]),
                  //color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(6)),
              child: Column(children: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      width: 9,
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.only(
                          //     topLeft: Radius.circular(15),
                          //     topRight: Radius.circular(15)),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/stedapnewsicon.png"),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Stedap News App",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.info,
                          color: Colors.white,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Build Version",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Version 1.0.0",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ]),
            ),
            Container(
              width: double.infinity,
              height: 250,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(9),
              decoration: BoxDecoration(
                  //gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlue]),
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(6)),
              child: Column(children: <Widget>[
                Text(
                  "Contact Us",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            onPressed: () {})),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Company",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Stepdap Incorperation",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                            icon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            onPressed: () {})),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "stephendappah1@gmail.com",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                            icon: Icon(
                              Icons.cloud_circle,
                              color: Colors.white,
                            ),
                            onPressed: () {})),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Website",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "stedap1.site.live",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                            icon: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            onPressed: () {})),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Us",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "+233 (0)27 584 6911",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ]),
            ),
            Container(
              width: double.infinity,
              height: 250,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(9),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(6)),
              child: Column(children: <Widget>[
                Text(
                  "Author",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            onPressed: () {})),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Company",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Stepdap Incorperation",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                            icon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            onPressed: () {})),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "stephendappah1@gmail.com",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                            icon: Icon(
                              Icons.cloud_circle,
                              color: Colors.white,
                            ),
                            onPressed: () {})),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Website",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "stedap1.site.live",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                            icon: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            onPressed: () {})),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Us",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "+233 (0)27 584 6911",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ]),
            ),
            Container(
              width: double.infinity,
              //height: 150,

              padding: EdgeInsets.all(9),
              margin: EdgeInsets.all(9),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "About",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      """More than just a traditional broadcaster, Stedap News is today evolving into a contect company the home of World's Most Popular programming and multimedia leader with a solid presence in the World. The station delivers service to all people on platforms ranging from news, online radio and audio on demand.""",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
