class Student {
  String name; //문자열 네임 선언
  int age; //정수형 나이 선언
  List<int> grades; //리스트(정수형)성적 선언

  Student(this.name, this.age, this.grades);
}

List<Student> students = []; //빈 학생 리스트 생성

void addStudent(String name, int age, List<int> grades) {
  students.add(Student(name, age, grades));
  print('$name 학생이 추가되었습니다.');
}

// 사용자에게 학생 이름, 나이,성적을 입력 받는다
double calculateAverage(List<int> grades) {
  if (grades.isEmpty) return 0;
  return grades.reduce((a, b) => a + b) / grades.length;
}

//사용자에게 과목점수를 입력 받고 성적의 평균 을 계산한다.
void printStudentInfo(Student student) {
  print('이름: ${student.name}, 나이: ${student.age}');
  print('평균 점수: ${calculateAverage(student.grades).toStringAsFixed(2)}');
}

//입력 받은 학생의 정보를 출력한다.
//이름: 이유준, 나이: 28
//평균 점수: 84
Student? findTopStudent() {
  if (students.isEmpty) return null; // 학생 리스트의 값이 널이 아니면 아래의 계산식을 실행
  return students.reduce((a, b) => //a,d변수 생성
      calculateAverage(a.grades) > calculateAverage(b.grades) ? a : b);
} //리스트에 있는 성적을 a,b에 넣고 비교 한다.

//리스트로 입력 받은 학생들의 성적을 비교하여 가장 높은  학생을 구한다.
//그후 findtop학생 변수에 저장한다.
void main() {
  addStudent('김철수', 20, [85, 90, 78]); //84.3
  addStudent('이영희', 22, [92, 88, 95]); //91.6
  addStudent('박민수', 21, [76, 85, 90]); //83.6

  print('\n모든 학생 정보:');
  students.forEach(printStudentInfo);
//이름: 김철수, 나이: 20, 평균 점수: 84.3
//이영희, 22, 91.6
//박민수, 21, 83.6

  print('\n최고 성적 학생:');
  Student? topStudent = findTopStudent();
  if (topStudent != null) {
    printStudentInfo(topStudent);
  } else {
    print('학생이 없습니다.');
  }
  //최고 성적 학생:이영희
}
