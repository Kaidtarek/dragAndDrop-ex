import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget StackImage({required BuildContext context}) {
  final screenwidth = MediaQuery.of(context).size.width;
  return Stack(
    children: [
      Image.asset('assets/Rectangle 18.png'),Positioned(
        //bottom: 10,
        right: screenwidth/3 +55  ,
        child: Image.asset('assets/salma - bag 1.png'),
      ),
      Positioned(
        bottom: 10,
        right: screenwidth/3  ,
        child: Image.asset('assets/Adam-3Q-Front 2.png'),
      ),
    ],
  );
}
