import 'package:flutter/material.dart';

class MyConteiner extends StatelessWidget {
  final Color? renk;
  final Widget? child;
  final Function()? onPress;
  MyConteiner({this.renk = Colors.white, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: renk,
        ),
      ),
    );
  }
}