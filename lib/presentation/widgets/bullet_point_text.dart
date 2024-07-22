import 'package:flutter/material.dart';

class BulletPointText extends StatelessWidget {
  const BulletPointText({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child:  RichText(
        text: TextSpan(
            text: "",
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: "$title: ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: subtitle,
              ),
            ]
        ),
      ),
    );
  }
}
