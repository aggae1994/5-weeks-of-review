Future<double> fetchPrice(String item) async {
  await Future.delayed(Duration(milliseconds: 200));
  return {'apple': 0.5, 'banana': 0.3, 'cherry': 0.8}[item] ?? 0.0;
}

//비동기 작업
//await Future.delayed(Duration(milliseconds: 200)) 0.2 초 후에 실행
//apple': 0.5, 'banana': 0.3, 'cherry': 0.8}[item] ?? 0.0; 과일 정보를 갇고있는 map
void main() async {
  final fruits = ['banana', 'cherry', 'apple', 'date', 'elderberry'];
//입력 받은 과일 값
  print('Fetching fruit prices...');
  final prices = await Future.wait(fruits.map(fetchPrice));
//Fetching fruit prices... 출력
//fruits.map(fetchPrice) 로 각과일의 이름을 호출한다.
//그후 과일의 가격을 prices 에 반환한다.

  final fruitPrices = List.generate(fruits.length,
      (index) => {'fruit': fruits[index], 'price': prices[index]});
//과일의 이름(fruit) 와 과일 의 가격(prices) 합쳐서 리스트를 만든다.
  fruitPrices.sort((a, b) => a['price']!.compareTo(b['price']!));
// a 에 첫번째 값 b에 두번째 값을 넣고 서로 비교하여 가격을 오름차순으로 정렬한다.
  print('Fruits sorted by price:');
  //Fruits sorted by price: banana': 0.3,apple': 0.5,cherry': 0.8
  fruitPrices.forEach((item) =>
      print('${item['fruit']}: \$${item['price']!.toStringAsFixed(2)}'));
}
//toStringAsFixed(2) 로 소수점 자리 두자리 까지 문자열로 반환 합니다.
//0.3 → "0.30", 0.8 → "0.80
//banana: $0.30
//apple: $0.50
//cherry: $0.80 출력
