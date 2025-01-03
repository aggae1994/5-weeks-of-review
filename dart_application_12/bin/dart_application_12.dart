Future<Map<String, int>> fetchWordCount(String word) async {
  await Future.delayed(Duration(milliseconds: 300));
  return {word: word.length};
}

//word 안에 들어갈 문자열의 길이를 계산합니다.
//300초 후
//word: 문자열 길이
void main() async {
  final words = ['apple', 'banana', 'cherry', 'date', 'elderberry'];
  //리스트 타입 words 의 문자열 값
  print('Fetching word counts...');
  //Fetching word counts... 출력
  final wordCounts = await Future.wait(words.map(fetchWordCount));
  //리스트 문자열 의 길이의 수를 계산하고 fetchWordCount에 전달한다.
  final flattenedCounts =
      Map.fromEntries(wordCounts.expand((map) => map.entries));
  print('Word counts: $flattenedCounts');
//word counts: apple: 5, banana: 6, cherry: 6, date: 4, elderberry: 10 출력
  final longWords = flattenedCounts.entries
      .where((entry) => entry.value > 5)
      .map((entry) => entry.key)
      .toList();
//문자열 길이가 5초과 인 문자열을 구한다.
//MapEntry 에서 조건에 맞는 것만 추출한다.
//추출한 값을 리스트로 변환한다.
// 해당 값을 longWords에 전달한다.
  print('Words with more than 5 characters: $longWords');
}
// 위 에서 구한 값을 출력한다.
//Words with more than 5 characters: banana, cherry, elderberry 출력