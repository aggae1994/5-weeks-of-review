import 'dart:io';

class MenuItem {
  String name;
  double price;
//문자열 이름,소수점을 표현하는 가격 선언
  MenuItem(this.name, this.price);
} //전역변수 선언

class Order {
  List<MenuItem> items = [];
//상품메뉴가 들어갈 빈 리스트 선언
  void addItem(MenuItem item) {
    items.add(item);
    print("${item.name}이(가) 주문에 추가되었습니다.");
  }

//사용자에게 상품 입력받는다.
//햄버거 이(가) 주문에 추가되었습니다.
  double getTotalPrice() {
    return items.fold(0, (sum, item) => sum + item.price);
  }

//상품 메뉴에서 고른 물건가격의 합을 계산한다.
//menuitem에 있는 가격을 sum에 누적 한다. 그 값을 gettotal에 전달한다.
  void displayOrder() {
    if (items.isEmpty) {
      print("주문 내역이 없습니다.");
    } else {
      print("주문 내역:");
      for (var item in items) {
        print("${item.name}: \$${item.price}");
      }
      //사용자가 고른 상품들의 이름과 가격을 출력한다.
      //주문 내역:
      //햄버거: 5.99
      //피자: 8.99
      //샐러드: 4.99
      print("총 금액: \$${getTotalPrice()}");
      //총 금액: 19.97
    }
  }
}

class Restaurant {
  List<MenuItem> menu = [
    MenuItem("햄버거", 5.99),
    MenuItem("피자", 8.99),
    MenuItem("샐러드", 4.99),
    MenuItem("음료", 1.99)
  ];

  void displayMenu() {
    print("메뉴:");
    for (var i = 0; i < menu.length; i++) {
      print("${i + 1}. ${menu[i].name}: \$${menu[i].price}");
    }
    //메뉴:
    //i는 메뉴의 수 만큼 1씩 증가한다.
    //1.햄버거: 5.99$
    //2.피자: 8.99$
    //3.샐러드: 4.99$
    //4.음료: 1.99$
  }
}

void main() {
  var restaurant = Restaurant();
  var order = Order();

  while (true) {
    print("\n음식 주문 시스템");
    print("1. 메뉴 보기");
    print("2. 주문하기");
    print("3. 주문 확인");
    print("4. 종료");
    stdout.write("선택: ");
    //사용자에게 인터페이스 화면이 지속적으로 보여줘야 하기 때문에 와일문을 사용한다.
//음식 주문 시스템
//1. 메뉴 보기
//2. 주문하기
//3. 주문 확인
//4 종료
//선택:
    var choice = int.tryParse(stdin.readLineSync() ?? "");
// int.tryParse 사용자의 입력을 정수로 반환 한다.
//readLineSync를 사용 하여 입력한 문자열을 읽어온다.

    switch (choice) {
      case 1:
        restaurant.displayMenu();
        //상품 메뉴 호출
        break;
      case 2:
        restaurant.displayMenu();
        //상품 메뉴 를 호출
        stdout.write("주문할 메뉴 번호: ");
        var menuIndex = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
        //사용자가 입력한 객체 번호를 리스트에서 찾아 해당 상품의 이름,가격을 가져온다.
        if (menuIndex > 0 && menuIndex <= restaurant.menu.length) {
          order.addItem(restaurant.menu[menuIndex - 1]);
          //메뉴인덱스의 초기값은  0 초과 여야한다.
          //리스트의 객체 번호는 0 부터 시작이다.
          //하지만 사용자 인터페이스는 1번부터 시작 이기 때문에 -1를 해줘서 리스트 객체번호를 호출할수있게한다.
        } else {
          print("잘못된 메뉴 번호입니다.");
          //거짓일 경우
          //잘못된 메뉴 번호입니다. 출력
        }
        break;
      case 3:
        order.displayOrder();
        break;
      // 사용자의 주문내역을 호출한다.
      case 4:
        print("프로그램을 종료합니다.");
        return;
      default:
        print("잘못된 선택입니다.");
      //4 를 초과할 경우
      // 잘못된 선택입니다. 를 출력
    }
  }
}
