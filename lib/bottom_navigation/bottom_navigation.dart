import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
        side: BorderSide(color: Colors.white, width: 6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              iconSize: 25,
              onPressed: () {},
              icon: Icon(Icons.person_outline),
            ),
            IconButton(
              iconSize: 25,
              color: Color(0xFFd1c8ff),
              onPressed: () {},
              icon: Icon(Icons.fiber_manual_record),
            ),
            IconButton(
              iconSize: 25,
              color: Color(0xFFd1c8ff),
              onPressed: () {},
              icon: Icon(Icons.card_travel),
            ),
          ],
        ),
      ),
    );
  }
}
