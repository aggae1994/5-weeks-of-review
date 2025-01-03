Future<String> fetchUserName(int id) async {
  await Future.delayed(Duration(milliseconds: 500));
  return 'User$id';
}

//string 타입 리스트 선언
//int 타입 id가 들어갈 fetchUserName 선언
//500초 후
//User$id' 실행
//그 후 값을 fetchUserName 전달
void main() async {
  final userIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  //user 값 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  final evenUserIds = userIds.where((id) => id.isEven);
// 리스트에 있는 user id 중 짝수 만을 evenUserIds에 전달
  print('Fetching user names for even IDs...');
  final userNames = await Future.wait(evenUserIds.map(fetchUserName));
//Fetching user names for even IDs... 출력
//evenUserIds 의 값을 fetchUserName에 전달하고 리스트 타입의 값을 User$id 으로 만듬
  print('Even user IDs: $evenUserIds');
  //Even user IDs:2, 4, 6, 8, 10
  print('Fetched user names: $userNames');
//Fetched user names: User2, User4, User6, User8, User10
  final userMap = Map.fromIterables(evenUserIds, userNames);
  userMap.forEach((id, name) => print('ID: $id, Name: $name'));
}
//ID: 2, Name: User2
//ID: 4, Name: User4
//ID: 6, Name: User6
//ID: 8, Name: User8
//ID: 10, Name: User10
