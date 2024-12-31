class Book {
  String title;
  String author;
  bool isCheckedOut;
//문자열 제목,작가,불타입 참,거짓 선언
  Book(this.title, this.author, {this.isCheckedOut = false});
//전역변수 선언
  @override
  String toString() => '$title by $author';
}

//to string 변수에 제목과 작가를 제목 by 작가 형식으로 값을 넣음
class Library {
  String name;
  //도서관 이름 을 입력할 name를 선언합니다.
  List<Book> books = [];
  //빈 북 리스트 선언
  Map<String, List<Book>> booksByAuthor = {};
//만들어진 리스트를 맵 형식으로 만들고 책이름과 작가 값을 넣을수있게 빈값으로 만든다.
  Library(this.name);
//위에서 생성받은 이름을 지역변수에 할당합니다.
  void addBook(Book book) {
    books.add(book);
    booksByAuthor.putIfAbsent(book.author, () => []).add(book);
  } // 저자를 넣었을때 리스트 내부에 저자에 대한 내용이 없을때 그 내용을 추가함

// 책의 정보를 사용자가 입력합니다.
  bool checkOutBook(String title) {
    var book =
        books.firstWhere((b) => b.title == title, orElse: () => Book('', ''));
    if (book.title.isNotEmpty && !book.isCheckedOut) {
      book.isCheckedOut = true;
      return true;
    } //사용자가 입력한 책의 제목을 리스트 book 와 비교하여 책이 있으면 참 출력
    return false;
  }

  bool returnBook(String title) {
    var book =
        books.firstWhere((b) => b.title == title, orElse: () => Book('', ''));
    if (book.title.isNotEmpty && book.isCheckedOut) {
      book.isCheckedOut = false;
      return true;
    } //책을 반납함
    return false;
  }

  List<Book> getBooksByAuthor(String author) {
    return booksByAuthor[author] ?? [];
  } //작가를 넣어서 책을 발췌하기 위함

//제목,작가를 입력합니다.
  List<Book> getAvailableBooks() {
    return books.where((book) => !book.isCheckedOut).toList();
  } //입력한 값을 to.list로 리스트 형태로 반환합니다.

//체크 아웃이 거짓인 모든 책들을 찾고 반환 함
  void displayLibraryStats() {
    print('Library: $name'); // library : City Central Library
    print(
        'Total books: ${books.length}'); // total books: 리스트에 들어있는 항목들의 수를 표시합니다.
    print('Checked out books: ${books.where((b) => b.isCheckedOut).length}');
    //대여 중인 책을 보여줌
    print('Available books: ${books.where((b) => !b.isCheckedOut).length}');
  } //반출가능한 책들을 보여줌
}

void main() {
  var library = Library('City Central Library');

  library.addBook(Book('1984', 'George Orwell'));
  library.addBook(Book('To Kill a Mockingbird', 'Harper Lee'));
  library.addBook(Book('Pride and Prejudice', 'Jane Austen'));
  library.addBook(Book('The Great Gatsby', 'F. Scott Fitzgerald'));
  library.addBook(Book('Animal Farm', 'George Orwell'));

  library.displayLibraryStats();

  print('\nChecking out "1984"...');
  if (library.checkOutBook('1984')) {
    print('Successfully checked out "1984"');
  }
//Checked out books: 1984
//'Successfully checked out "1984"
  print('\nBooks by George Orwell:');
  library.getBooksByAuthor('George Orwell').forEach(print);
//Books by George Orwell: Animal Farm by George Orwel 1984 by George Orwell

  print('\nAvailable books:');
  library.getAvailableBooks().forEach(print);
//Available books: 1984 by George Orwell
  library.displayLibraryStats();
}
