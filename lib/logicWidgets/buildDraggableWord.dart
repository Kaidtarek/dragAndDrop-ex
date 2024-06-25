import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class buildDraggableWord extends StatelessWidget {
  buildDraggableWord({super.key,required this.word});
 
  final String word;
  @override
  Widget build(BuildContext context) {
    return Container(
            width: 80,
            height: 32,
            child: Center(
                child: Text(word, style: GoogleFonts.cairo(color: Colors.white))),
            decoration: BoxDecoration(
              color: Color(0xFF369DD8),
              borderRadius: BorderRadius.circular(8),
            ),
          );
  }
}
