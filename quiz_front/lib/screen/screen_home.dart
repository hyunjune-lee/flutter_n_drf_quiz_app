import 'package:flutter/material.dart';
import 'package:quiz_app_test/model/model_quiz.dart';
import 'package:quiz_app_test/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
  ];

  @override
  Widget build(BuildContext context) {
    /*어떤 기기에서든 똑같은 비율로 보여주기 위해서
     * 현재 기기의 여러 상태 정보를 알 수 있는 MediaQuery를 사용해
     * 크기 정보를 가져옴
     * => 이를 통해 높이나 크기에 대해 상수를 사용하지 않고
     * width 값이나 height 값에 곱한 값을 이용할 것
     */
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    /*SafeArea는 기기의 상단 노티 바 부분, 하단 영역을 침범하지 않는
    안전한 영역을 잡아주는 위젯*/
    return WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('My Quiz App'),
              backgroundColor: Colors.deepPurple,
              //Container를 비움으로써 자동으로 생기는 뒤로 가기 버튼을 지우는 효과
              leading: Container(),
            ), //AppBar
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // 퀴즈 이미지를 들어갈곳
                Center(
                  child: Image.asset(
                    'images/quiz.jpeg',
                    width: width * 0.8,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.024),
                ),
                Text(
                  '플리터 퀴즈 앱',
                  style: TextStyle(
                    fontSize: width * 0.065,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '퀴즈를 풀기 전 안내사항',
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.all(width * 0.048)),
                _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
                _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤\n다음 문제 버튼을 눌러주세요.'),
                _buildStep(width, '3. 만점을 향해 도전해보세요!'),
                Padding(
                  padding: EdgeInsets.all(width * 0.048),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: width * 0.036),
                    child: Center(
                      child: ButtonTheme(
                        minWidth: width * 0.8,
                        height: height * 0.05,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          child: Text(
                            '지금 퀴즈 풀기',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.deepPurple,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                  quizs: quizs,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        width * 0.048,
        width * 0.024,
        width * 0.048,
        width * 0.024,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.024),
          ),
          Text(title),
        ],
      ),
    );
  }
}
