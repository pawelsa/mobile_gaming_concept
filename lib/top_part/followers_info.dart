import 'package:flutter/material.dart';

class FollowerInfo extends StatelessWidget {
  final String numberText;
  final String title;

  FollowerInfo(
    this.numberText,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          numberText,
          style: Theme.of(context).textTheme.body1.copyWith(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 0.5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontSize: 11, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
