import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../logicWidgets/buildTargetBox.dart';

Widget DropImplement(
    {required List<String> words,
    required List<String> correctWords,
    required List<String> targetWords,
    required List<bool> isWordDragged}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTargetBox(
            index: 0,
            isWordDragged: isWordDragged,
            targetWords: targetWords,
            words: words,
          ),
          DecorateText(text: 'ذهب التلميذ إلى')
        ],
      ),
      SizedBox(height: 14),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecorateText(text: 'صباحا'),
          buildTargetBox(
            index: 1,
            isWordDragged: isWordDragged,
            targetWords: targetWords,
            words: words,
          ),
          DecorateText(text: 'على الساعة')
        ],
      ),
    ],
  );
}

Widget DecorateText({required String text}) {
  return Row(
    children: [
      SizedBox(width: 10),
      Text(
        text,
        style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 10),
    ],
  );
}
