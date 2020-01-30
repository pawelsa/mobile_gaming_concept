import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String text;

  InfoChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          color: Color(0xFFf4f2ff),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.body1.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF795eff)),
        ),
      ),
    );
  }
}
