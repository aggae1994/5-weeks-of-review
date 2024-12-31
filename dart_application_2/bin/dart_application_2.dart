import 'dart:async';

class Todo {
  String id;
  String title;
  bool isCompleted;
//문자열 타입에 아이디,타이틀 선언
//참, 거짓에 따라 true를 나타내는 불 타입 선언
  Todo(this.id, this.title, this.isCompleted);
}

//전역변수 선언
class TodoService {
  final List<Todo> _todos = []; //빈 todo 리스트 생성
  final _todoController = StreamController<List<Todo>>.broadcast();
// 리스트 데이터 를 스트림 컨트롤로 관리
  Stream<List<Todo>> get todos => _todoController.stream;

  void addTodo(String title) {
    final todo = Todo(DateTime.now().toString(), title, false);
    _todos.add(todo);
    _todoController.add(_todos);
  }

// 리스트에 현재 시간,타이틀, 거짓을 사용자 에게 입력 받습니다.
  void toggleTodo(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    // 입력 받은 id가 리스트에 있는지 확인합니다.
    todo.isCompleted = !todo.isCompleted;
    _todoController.add(_todos);
  }

// 리스트에 같은 id가 없다면 리스트에 거짓 값을 입력합니다.
  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    _todoController.add(_todos);
  }

//거짓 값을 받은 id를 리스트에서 삭제합니다.
  void dispose() {
    _todoController.close();
  }
}

// 사용자가 값을 입력할수있는 컨트롤러를 종료합니다.
void main() {
  final todoService = TodoService();

  todoService.todos.listen((todos) {
    print('할 일 목록 업데이트:');
    for (var todo in todos) {
      print('${todo.title} - ${todo.isCompleted ? "완료" : "미완료"}');
    }
    print('---');
  });
//할 일 목록 업테이트:
//flutter 공부하기 - 완료 : 미완료
//---------------------------------
//0
//컨트롤러 종료
  todoService.addTodo('Flutter 공부하기');
  todoService.addTodo('Dart 코드 작성하기');
  todoService.toggleTodo(todoService._todos[0].id);
  todoService.removeTodo(todoService._todos[1].id);

  todoService.dispose();
}
