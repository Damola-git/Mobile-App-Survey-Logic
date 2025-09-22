
s
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    final _questions = [
      {
        'questionText': 'How relevant do you find the ads on youtube',
        'answers': ['Very relevant', 'Somewhat relevant', 'Not relevant at all'],
      },
      {
        'questionText': 'How often do ads interrupt your experience',
        'answers': ['Too often', 'Sometimes', 'Rarely', 'Never'],
      },
      {
        'questionText': 'How likely are you to recommend Youtube to a friend',
        'answers': ['Very likely', 'Likely', 'Neutral', 'Unlikely', 'Very unlikely'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length ? Column(
          children: [
            Question(
              _questions[_questionIndex]['questionText'] as String,
            ),
            ...(_questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
          ],
        )
         : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "🎉 Thank you for your feedback!",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),                
                  ],
                ),
      ),
    ));
  }
}
