import 'package:flutter/material.dart';

Widget checkAnswers(
    {required List<String> targetWords,
    required List<String> correctWords,
    required BuildContext context}) {
      double accuracy = 0.0;
     for (var i = 0; i < correctWords.length; i++) {
       correctWords[i] == targetWords[i] ? accuracy++ : null;
     }
     accuracy=accuracy/correctWords.length*100;
     String format = accuracy.toStringAsFixed(1);
  return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Accuracy'),
            content: Text('Your accuracy is ${format} %'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
      child: Text("SUBMIT"));
}
