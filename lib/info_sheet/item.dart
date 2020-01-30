import 'package:flutter/material.dart';
import 'package:mobile_gaming_concept/info_sheet/item_data.dart';

class Item extends StatelessWidget {
  final ItemData itemData;
  final bool isElevated;
  final GestureTapCallback onTap;

  Item({this.itemData, this.isElevated, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.only(bottom: isElevated ? 5 : 0),
      child: Material(
        color: Colors.white,
        elevation: isElevated ? 4 : 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(itemData.imageUrl),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(itemData.title),
                Expanded(
                  child: Container(),
                ),
                Text(
                  itemData.startTime,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
