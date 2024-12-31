import 'dart:io';

class Question {
  String question;
  List<String> options;
  int correctAnswer;
//문자열,리스트 타입에 문자열,정수 타입 변수 선언
  Question(this.question, this.options, this.correctAnswer);
//전역변수 선언
  bool checkAnswer(int userAnswer) {
    return userAnswer == correctAnswer;
  } //사용자가 입력한 퀴즈의 탑이 참,거짓인지 판별한다.
  //user 답안 과 크로스 답안을 비교하여 맞으면 참 아니면 거짓을 출력한다
}

class Quiz {
  List<Question> questions = [];
  int score = 0;
//퀴즈가 들어갈 리스트와 점수가 들어갈 스코어를 초기화 한다.
  void addQuestion(Question question) {
    questions.add(question);
  }

//퀴즈를 입력받는다.
  void startQuiz() {
    for (var i = 0; i < questions.length; i++) {
      print("\n질문 ${i + 1}: ${questions[i].question}");
      //리스트 안에 있는 퀴즈의 수만큼 i는 1씩 증가한다
      //i의 값 위치에 있는 퀴즈를 사용자에게 보여준다.
      //질문 1 : "다트(Dart)의 개발사는?",
      for (var j = 0; j < questions[i].options.length; j++) {
        print("${j + 1}. ${questions[i].options[j]}");
      }
      //j는 i번에 있는 퀴즈의 보기 만큼 증가한다.
      //1.애플
      //2.구글
      //3.마이크로소프트
      //4.페이스북

      stdout.write("답변 선택 (1-${questions[i].options.length}): ");
      var userAnswer = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
      //i번 퀴즈 의 보기 갯수를 표시한다.
      //답변 선택 (1-4):

      if (questions[i].checkAnswer(userAnswer)) {
        print("정답입니다!");
        score++;
        //답변이 참 일 경우 점수 증가
      } else {
        print("틀렸습니다. 정답은 ${questions[i].correctAnswer}번입니다.");
      }
    }
    // 거짓일 경우 문제의 정답을 보여준다.

    print("\n퀴즈 종료! 당신의 점수: $score / ${questions.length}");
  }
  // 준비된 3개의 퀴즈가 모두 종료 되면 score에 누적되어 있는 값을 사용자에게 보여준다.
}

void main() {
  var quiz = Quiz();

  quiz.addQuestion(Question(
      "다트(Dart)의 개발사는?", ["Apple", "Google", "Microsoft", "Facebook"], 2));

  quiz.addQuestion(
      Question("다트의 주요 용도는?", ["웹 개발", "모바일 앱 개발", "데스크톱 앱 개발", "모두"], 4));

  quiz.addQuestion(Question(
      "다트에서 'final'과 'const'의 차이점은?",
      [
        "차이 없음",
        "final은 런타임에, const는 컴파일 타임에 값이 결정됨",
        "const는 런타임에, final은 컴파일 타임에 값이 결정됨",
        "final은 변경 가능, const는 변경 불가능"
      ],
      2));

  print("간단한 퀴즈 게임을 시작합니다!");
  // 질문이 시작되기 전 표시 되는 문자열
  //간단한 퀴즈 게임을 시작합니다!
  //질문 3: 다트에서 final과const의 차이점은?
  //1. 차이없음
  //2.final은 런타임에, const는 컴파일  타임에 값이 결정됨
  //3.const는 런타임에, flinal은 컴파일 타임에 값이 결정됨
  //4.final은 변경가능, const는 변경 불가능
  //답변 선택 (1-4):3
  //틀렸습니다. 정답은 2번입니다

  quiz.startQuiz();
}
