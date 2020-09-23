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
      debugShowCheckedModeBanner: false,
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
      home: MediatorPage(),
    );
  }
}

class MediatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage(MediaQuery.of(context).size.height);
  }
}

class MyHomePage extends StatefulWidget {
  final screenHeight;

  MyHomePage(this.screenHeight);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var containerSize = 0.0;
  var imageSize = 0.0;
  var infoPadding = 80.0;
  var minHeightFraction = 0.35;
  var maxHeightFraction = 0.7;
  var initSize = 0.5;
  var minHeight = 0.0;
  var maxHeight = 0.0;

  @override
  void initState() {
    super.initState();
    containerSize = widget.screenHeight * initSize;
    imageSize = widget.screenHeight - containerSize;
    infoPadding = imageSize / 3;
    minHeight = widget.screenHeight * minHeightFraction;
    maxHeight = widget.screenHeight * maxHeightFraction;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFcf8af7),
      bottomNavigationBar: BottomNavigation(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              height: imageSize,
              duration: Duration.zero,
              child: Image.network(
//                "https://cdna.artstation.com/p/assets/covers/images/019/022/400/20190627140342/micro_square/death-burger-sai-close-v6.jpg?1561662222",
                "https://cdnb.artstation.com/p/assets/images/images/019/023/035/large/death-burger-zombie-pain-v13.jpg?1561663855",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          AnimatedPadding(
            duration: Duration.zero,
            padding: EdgeInsets.only(top: infoPadding, left: 20, right: 20),
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
            child: InfoSheet(
                sheetHeight: containerSize,
                dragCallback: (info) {
                  setState(() {
                    var tempSize = containerSize - info.primaryDelta;
                    if (tempSize < minHeight) {
                      containerSize = minHeight;
                    } else if (tempSize > maxHeight) {
                      containerSize = maxHeight;
                    } else {
                      containerSize = tempSize;
                    }
                    imageSize =
                        MediaQuery
                            .of(context)
                            .size
                            .height - containerSize;
                    infoPadding = imageSize / 3;
                  });
                }),
          ),
          CustomAppBar(),
        ],
      ),
    );
  }
}
