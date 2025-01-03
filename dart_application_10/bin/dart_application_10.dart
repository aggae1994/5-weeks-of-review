import 'dart:async';

Future<int> processNumber(int num) async {
  await Future.delayed(Duration(seconds: 1));
  return num * 2;
}

// 정수 num 선언
//비동기로 numbers의 값을 가져 오고
//1초후
//동기로 가져온 numbers의 값에 * 2를 해준다.
void main() async {
  final numbers = [1, 2, 3, 4, 5];
// 비동기 numbers의 값
  print('Processing numbers...');
  final results = await Future.wait(numbers.map(processNumber));
  //numbers의 값을 가져오고
  //processnumber를 사용하여 * 2를 처리하고 다시 반환한다.
//Processing numbers...
  print('Original numbers: $numbers');
  print('Processed numbers: $results');
//Original numbers: [1, 2, 3, 4, 5]
//num * 2;
//processed numbers: [2, 4, 6, 8, 10]
  final sum = results.reduce((a, b) => a + b);
  //a 값에는 첫번째 값, b 값에는 두번째 값을 넣고
  //계산이 끝나면 결과 값을 다시 a 값에 넣고 다음 값을 b에 넣는다
  //이걸 반복한다.
  //그후 결과 값은 sum의 값이 된다.
  print('Sum of processed numbers: $sum');
  //Sum of processed numbers: 30
  //2,4,6,8,10의 총합 값인 30 출력
}
