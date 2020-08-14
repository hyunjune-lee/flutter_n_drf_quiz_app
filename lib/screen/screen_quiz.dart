import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quiz.dart';

class QuizScreen extends StatefulWidget {
  List<Quiz> quizs;
  // 이렇게 이전 화면으로부터 quizs를 받아올 수 있음
  QuizScreen({this.quizs});
  //상태관리를 위해
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //사용자의 정답을 담아놓을 곳
  List<int> _answers = [-1, -1, -1];
  // 각 보기가 눌려있는지 안 눌려있는지 체크하는 곳
  List<bool> _answerState = [false, false, false, false];
  //현재 어떤 문제를 보고 있는지
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.deepPurple),
            ),
            width: width * 0.85,
            height: height * 0.5,
          ),
        ),
      ),
    );
  }
}
