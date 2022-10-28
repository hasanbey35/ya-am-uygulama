import 'package:flutter/material.dart';
import 'package:yashesap/constants.dart';

class IconCinsiyet extends StatelessWidget {
  final String? cinsiyett;
  final IconData? icon;

  IconCinsiyet({this.icon, this.cinsiyett});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$cinsiyett',
          style: kMetinStili,
        ),
      ],
    );
  }
}