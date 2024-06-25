 import 'package:flutter/material.dart';

Widget buildPlaceholder(int index) {
    return Container(
      width: 62,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }