import 'package:flutter/material.dart';
import 'package:mobile_gaming_concept/app_bar.dart';
import 'package:mobile_gaming_concept/bottom_navigation/bottom_navigation.dart';
import 'package:mobile_gaming_concept/info_sheet/info_sheet.dart';
import 'package:mobile_gaming_concept/top_part/followers_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile gaming',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFFf4f2ff),
        primaryIconTheme: IconThemeData(
          color: Color(0xFFA399DC),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF795eff),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFcf8af7),
      bottomNavigationBar: BottomNavigation(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: FractionallySizedBox(
              heightFactor: 0.55,
              child: Image.network(
                "https://cdna.artstation.com/p/assets/covers/images/019/022/400/20190627140342/micro_square/death-burger-sai-close-v6.jpg?1561662222",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FollowerInfo("10K", "FOLLOWING"),
                FollowerInfo("75K", "FOLLOWERS"),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InfoSheet(),
          ),
          CustomAppBar(),
        ],
      ),
    );
  }
}
