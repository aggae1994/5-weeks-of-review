import 'dart:math';

void main() {
  List<int> numbers = List.generate(20, (index) => Random().nextInt(100));
  //0부터 19까지 리스트 오름차순으로 호출한다.
  //0부터 99 까지 랜덤으로 호출한다.
  // length가 20이므로0부터19자리의 값을 오름차순으로 호출하면서 그 값은 0부터 99 중 랜덤으로 정해진다.
  //리스트를 생성한다.
  print('$numbers');
//[86, 51, 26, 68, 14, 7, 64, 7, 22, 44, 86, 89, 19, 8, 10, 50, 89, 87, 45, 95]
  List<int> evenNumbers = numbers.where((num) => num % 2 == 0).toList();
  //위에서 생성한 리스트 중 짝수인 모든 정수를 찾고 리스트를 생성한다.
  print('$evenNumbers');
//[86, 26, 68, 14, 64, 22, 44, 86, 8, 10, 50]
  List<int> addedNumbers = numbers.map((num) => num + 10).toList();
  //numbers 리스트 를 호출해 객체 값에 + 10 한 새로운 리스트를 생성한다.
  print('$addedNumbers');
//[96, 61, 36, 78, 24, 17, 74, 17, 32, 54, 96, 99, 29, 18, 20, 60, 99, 97, 55, 105]
  numbers.sort();
  //랜덤 값으로 생성한 numbers 리스트를 오름차순으로 정렬한다.
  print('$numbers');
//[7, 7, 8, 10, 14, 19, 22, 26, 44, 45, 50, 51, 64, 68, 86, 86, 87, 89, 89, 95]
  List<int> firstFive = numbers.take(5).toList();
  //오름차순 값으로 정렬한 numbers 리스트의 값중 5개만 호출하여 리스트를 생성한다.
  print('$firstFive');
//[7, 7, 8, 10, 14]
  int sum = numbers.reduce((value, element) => value + element);
  //numbers 의 1번 값 과 2번째 값을 연산하고 그 값을 value에 넣고 현재 계산
  //해야하는 값은 element에 넣는다.
  //이렇게 연산 된 값을 sum 변수에 넣는다.
  print('$sum');
//967
  int max = numbers.reduce((curr, next) => curr > next ? curr : next);
  //curr에 1번 값,next의 2번값을 비교하여 최대 값을 연산한다.
  //그 값을 변수 max에 넣는다.
  print('$max');
//95
  List<int> reversedList = numbers.reversed.toList();
  //numbers 리스트에 있는 값을 호출하여 그 값을 거꾸로 만들고
  //리스트로 생성한다.
  print('$reversedList');
//[95, 89, 89, 87, 86, 86, 68, 64, 51, 50, 45, 44, 26, 22, 19, 14, 10, 8, 7, 7]
  List<int> uniqueNumbers = numbers.toSet().toList();
  //numbers에 중복이 있는지 확인하고 그것을 제거한다.
  //중복값이 제거된 값으로 리스트를 생성한다.
  print('$uniqueNumbers');
//[7, 8, 10, 14, 19, 22, 26, 44, 45, 50, 51, 64, 68, 86, 87, 89, 95]
  List<String> filledList = List.filled(5, '다트');
  //filled를 사용하여 5 칸 짜리 리스트를 생성하고
  //각각 "다트" 라는 문자열 데이터가 들어있게 된다.
  print('$filledList');
  //[다트,다트,다트,다트,다트]
}
