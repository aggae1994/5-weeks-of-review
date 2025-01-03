class Student {
  String name;
  List<int> scores;
//문자열 타입 name
//리스트 타입의 정수형 값 scores 선언
  Student(this.name, this.scores);
//전역변수 선언
  double get average =>
      scores.isEmpty ? 0 : scores.reduce((a, b) => a + b) / scores.length;
}

// 정수 형 scores 로 전달 받은 값을 a(전 계산결과) + b(현재 계산결과) 로 누적합
// scores 의 객체 수로 나누어 평균값을 구한 후
// 소수형 get average 로 전달 한다.
void main() {
  var students = [
    Student('Alice', [85, 90, 78]), //84.3
    Student('Bob', [92, 88, 95]), //91.6
    Student('Charlie', [76, 80, 85]) //80.3
  ];

  students.sort((a, b) => b.average.compareTo(a.average));
// 평균 점수를 비교 하여 내림차순으로 정렬한다.
  print('학생 성적 순위:');
  for (var student in students) {
    print('${student.name}: 평균 ${student.average.toStringAsFixed(2)}');
  }
//학생 성적 순위:
//bob: 평균 91.6
//alice: 평균 84.3
//charlie: 평균 80.3

  var topStudent = students.first;
  print(
      '\n최고 성적 학생: ${topStudent.name}, 평균: ${topStudent.average.toStringAsFixed(2)}');
}
//
//최고 성적 학생: bob, 평균: 91.6