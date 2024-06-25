import 'package:flutter/material.dart';
import 'package:movecorrect/logicWidgets/buildDraggableWord.dart';
import 'package:movecorrect/logicWidgets/buildPlaceholder.dart';

class buildTargetBox extends StatefulWidget {
  buildTargetBox(
      {super.key,
      required this.isWordDragged,
      required this.targetWords,
      required this.words,
      required this.index});
  final List<String> words;
  final List<String> targetWords;
  final List<bool> isWordDragged;
  final int index;

  @override
  State<buildTargetBox> createState() => _buildTargetBoxState();
}

class _buildTargetBoxState extends State<buildTargetBox> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return widget.targetWords[widget.index].isNotEmpty
            ? Draggable<String>(
                data: widget.targetWords[widget.index],
                child:
                    buildDraggableWord(word: widget.targetWords[widget.index]),
                feedback: Material(
                  child: buildDraggableWord(
                    word: widget.targetWords[widget.index],
                  ),
                ),
                childWhenDragging: buildPlaceholder(widget.index),
                onDragCompleted: () {
                  setState(() {
                    widget.targetWords[widget.index] =
                        ''; // Clear word from target box when dragged
                  });
                },
              )
            : Card(
              child: Container(
                  width: 136,
                  height: 39,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                ),
            );
      },
      onWillAcceptWithDetails: (details) {
        return widget.targetWords[widget.index].isEmpty;
      },
      onAcceptWithDetails: (details) {
        setState(() {
          int wordIndex = widget.words.indexOf(details.data);
          if (wordIndex != -1) {
            widget.isWordDragged[wordIndex] = true;
          }
          widget.targetWords[widget.index] = details.data;
        });
      },
    );
  }
}
