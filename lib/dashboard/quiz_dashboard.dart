import 'package:flutter/material.dart';
import 'package:thinkr/screens/quiz_screen.dart';
import 'package:thinkr/utils/routes.dart';

class QuizDashboard extends StatelessWidget {
  const QuizDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("top_swirl.png"),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Exciting quiz questions are waiting for you!'),
              Text('Test the knowledge you\'ve acquired.'),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    Routes.asDefault(QuizScreen())
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Test Knowledge",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "10 questions",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ],
    );
  }
}