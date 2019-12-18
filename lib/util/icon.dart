import 'package:flutter/material.dart';

Widget leadingIcon(String src) {
  return Container(
    width: 48.0,
    height: 48.0,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: new NetworkImage(src),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
  );
}
