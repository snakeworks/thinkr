import 'package:flutter/material.dart';
import 'package:thinkr/utils/quiz_questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> _questions;
  
  int _currentQuestionIndex = 0;
  int _points = 0;

  @override
  void initState() {
    super.initState();
    _questions = QuizQuestions.getRandom(10);
  }

  void _onAnswer(int index) {
    if (index == _questions[_currentQuestionIndex].answerIndex) {
      _points++;
    }
    setState(() {
      _currentQuestionIndex++;
    });
  }

  bool _isFinished() {
    return _currentQuestionIndex >= _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_isFinished()) ... [
                Text("Finished!"),
                Text("You scored: $_points/${_questions.length}"),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, 
                  child: Text("Return")
                )
              ] else ... [
                Text(
                  "${_currentQuestionIndex+1}. ${_questions[_currentQuestionIndex].question}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 8.0),
                for (var (index, answer) in _questions[_currentQuestionIndex].answers.indexed) ...[
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () { _onAnswer(index); },
                      child: Text(answer)
                    ),
                  ),
                  const SizedBox(height: 8.0)
                ]
              ]
            ],
          ),
        ),
      ),
    );
  }
}
