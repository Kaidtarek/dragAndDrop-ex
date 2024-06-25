import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movecorrect/logicWidgets/buildDraggableWord.dart';
import 'package:movecorrect/logicWidgets/buildPlaceholder.dart';
 import 'package:movecorrect/widget/checkAnswer.dart';
import 'package:movecorrect/widget/dropTop.dart';
import 'package:movecorrect/widget/stackImage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('draft arabiyati')),
        body: DragDropExample(),
      ),
    );
  }
}

class DragDropExample extends StatefulWidget {
  @override
  _DragDropExampleState createState() => _DragDropExampleState();
}

class _DragDropExampleState extends State<DragDropExample> {
  final List<String> words = ['المنزل', 'المدرسة', 'الثامنة', 'الشاي'];
  final List<String> correctWords = ['المنزل', 'المدرسة'];
  final List<String> targetWords = ['', ''];
  final List<bool> isWordDragged = [false, false, false, false];
  // List<String> words, List<String> correctWords, List<String> targetWords, List<bool> isWordDragged
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StackImage(context: context),
            DropImplement(
                words: words,
                correctWords: correctWords,
                targetWords: targetWords,
                isWordDragged: isWordDragged),
            SizedBox(height: 20),
            // if you like splitting this Wrap() you  just need to use state management to save the movement of targetWords List
            Wrap(
              spacing: 10,
              children: List.generate(words.length, (index) {
                return DragTarget<String>(
                  builder: (context, candidateData, rejectedData) {
                    return isWordDragged[index] && words[index].isEmpty
                        ? buildPlaceholder(index)
                        : Draggable<String>(
                            data: words[index],
                            feedback: Material(
                              child: buildDraggableWord(word: words[index]),
                            ),
                            childWhenDragging: buildPlaceholder(index),
                            onDragStarted: () {
                              print("### start drag");
                              setState(() {
                                isWordDragged[index] = true;
                              });
                            },
                            onDraggableCanceled: (_, __) {
                              print("### canceled drag");
                              setState(() {
                                isWordDragged[index] = false;
                              });
                            },
                            onDragCompleted: () {
                              print("### complated drag");
                              setState(() {
                                isWordDragged[index] = true;
                                words[index] = '';
                              });
                            },
                            child: buildDraggableWord(word: words[index]),
                          );
                  },
                  onWillAcceptWithDetails: (details) {
                    return words[index].isEmpty; //
                  },
                  onAcceptWithDetails: (details) {
                    setState(() {
                      int targetIndex = targetWords.indexOf(details.data);

                      if (targetIndex != -1) {
                        targetWords[targetIndex] =
                            ''; // Clear the word from the target box
                      }
                      words[index] =
                          details.data; // Return word to its original place
                      isWordDragged[index] = false;
                    });
                  },
                );
              }),
            ),
            checkAnswers(
              targetWords: targetWords,
              correctWords: ['المدرسة', 'الثامنة'],
              context: context,
            )
          ],
        ),
      ),
    );
  }
}
