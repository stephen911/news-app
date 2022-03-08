//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app_api/views/homepage.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'helper/constant.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await path.getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox("theme");
  await Hive.openBox("country");
  runApp(MyApp());
}

// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   ThemeData darkTheme = ThemeData(
//     accentColor: Colors.black,
//     brightness: Brightness.dark,
//     primaryColor: Colors.amber,
//   );

//   ThemeData lightTheme = ThemeData(
//     accentColor: Colors.blueAccent,
//     brightness: Brightness.light,
//     //primaryColor: Colors.blue,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     splashColor: Colors.white,
//     primaryColor: Colors.white,
//   );

//   bool light = false;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stedap News',
//       color: Colors.blueAccent,
//       debugShowCheckedModeBanner: false,
//       theme: light
//           ? lightTheme
//           //ThemeData(
//           //   visualDensity: VisualDensity.adaptivePlatformDensity,
//           //   splashColor: Colors.white,
//           //   primaryColor: Colors.white,
//           // )
//           : darkTheme,
//       home: HomePage(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        accentColor: Colors.blueAccent,
        brightness: Brightness.light,
        //primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.blueAccent,
        //primaryColor: Colors.white,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Stedap News',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        
        home: HomePage(),
      ),
    );
  }
}
