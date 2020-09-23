import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_gaming_concept/dialog_without_padding.dart';
import 'package:mobile_gaming_concept/info_dialog.dart';
import 'package:mobile_gaming_concept/info_sheet/info_chip.dart';
import 'package:mobile_gaming_concept/info_sheet/item.dart';
import 'package:mobile_gaming_concept/info_sheet/item_data.dart';

class InfoSheet extends StatelessWidget {
  final GestureDragUpdateCallback dragCallback;
  final double sheetHeight;

  InfoSheet({this.sheetHeight, this.dragCallback});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _DraggablePill(dragCallback),
        AnimatedContainer(
          duration: Duration.zero,
          height: sheetHeight,
          decoration: _sheetDecoration(),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 24.0,
              right: 24.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onVerticalDragUpdate: dragCallback,
                  child: _TopPartOfSheet(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return Item(
                        itemData: itemList[index],
                        isElevated: index == 0,
                        onTap: () {
                          showDialogWithInsets(
                            context: context,
                            builder: (BuildContext context) {
                              return InfoDialog();
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration _sheetDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      shape: BoxShape.rectangle,
      boxShadow: _topShadows,
    );
  }
}

class _DraggablePill extends StatelessWidget {
  final GestureDragUpdateCallback dragCallback;

  _DraggablePill(this.dragCallback);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: dragCallback,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 21, horizontal: 30),
        child: Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }
}

class _TopPartOfSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Korben",
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(fontSize: 35, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  color: Colors.greenAccent, shape: BoxShape.circle),
            ),
            Expanded(
              child: Container(),
            ),
            Icon(Icons.more_vert),
          ],
        ),
        Text(
          "Seattle, WA",
          style: Theme.of(context)
              .textTheme
              .body1
              .copyWith(fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            "25 year-old Pacific Northwest native. Currently steaming everything from Modern Warefare to Forza Motorsport. Catch me weekdays at 7 PST.",
            style: Theme.of(context)
                .textTheme
                .body1
                .copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          "Appearing online",
          style: Theme.of(context)
              .textTheme
              .body1
              .copyWith(fontSize: 15, color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Wrap(
            spacing: 6,
            runSpacing: 6,
            children: chipList,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Events",
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Icon(
              Icons.search,
              size: 30,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}

final _topShadows = [
  BoxShadow(
    color: Colors.black12,
    blurRadius: 30,
    spreadRadius: 50,
    offset: Offset(
      0,
      -10,
    ),
  ),
  BoxShadow(
    color: Colors.white,
    spreadRadius: 30,
    blurRadius: 30,
    offset: Offset(
      0,
      90,
    ),
  ),
];

final itemList = [
  ItemData(
    title: "Forza Season 1",
    startTime: "Live",
    imageUrl:
        "https://compass-ssl.xbox.com/assets/1f/7e/1f7e1ce8-ac7f-4d17-8f44-727e780b445a.jpg?n=FM7_Content-Placement-0_Forza-logo_740x417.jpg",
  ),
  ItemData(
    title: "Cyberpunk Online",
    startTime: "10:00 am",
    imageUrl:
        "https://purepng.com/public/uploads/medium/purepng.com-cyberpunk-2077-logologosgame-logogame-logosgameslogocyberpunk-2077-12715289961323gnbu.png",
  ),
  ItemData(
    title: "Wolfenstein",
    startTime: "9:00 am",
    imageUrl:
        "https://ih1.redbubble.net/image.878437765.7024/flat,750x,075,f-pad,750x1000,f8f8f8.u1.jpg",
  ),
  ItemData(
    title: "Forza Season 1",
    startTime: "Live",
    imageUrl:
        "https://compass-ssl.xbox.com/assets/1f/7e/1f7e1ce8-ac7f-4d17-8f44-727e780b445a.jpg?n=FM7_Content-Placement-0_Forza-logo_740x417.jpg",
  ),
  ItemData(
    title: "Cyberpunk Online",
    startTime: "10:00 am",
    imageUrl:
        "https://purepng.com/public/uploads/medium/purepng.com-cyberpunk-2077-logologosgame-logogame-logosgameslogocyberpunk-2077-12715289961323gnbu.png",
  ),
  ItemData(
    title: "Wolfenstein",
    startTime: "9:00 am",
    imageUrl:
        "https://ih1.redbubble.net/image.878437765.7024/flat,750x,075,f-pad,750x1000,f8f8f8.u1.jpg",
  ),
];

final chipList = [
  "COMPETITIVE",
  "ENGLISH",
  "FPS",
  "MULTIPLAYER",
  "PRO",
  "RAIDING",
  "SOLO",
  "STREAMING",
  "VERIFIED",
  "17+",
].map((item) => InfoChip(item)).toList();
