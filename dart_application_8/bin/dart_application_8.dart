class Song {
  String title;
  String artist;
  int duration; // 초 단위
//문자열 title,artist 선언
//정수형 duration 선언
  Song(this.title, this.artist, this.duration);
// 전역 변수 선언
  @override
  String toString() => '$title by $artist';
}

// 문자열 변수 toString 값은 Shape of You by Ed Sheeran 형식
class Playlist {
  String name;
  List<Song> songs = [];
// 문자열 name 선언
// song 값이 전달될 리스트 생성
  Playlist(this.name);
//내부 변수 선언
  void addSong(Song song) {
    songs.add(song);
  }

// List<Song>에 곡에 대한 정보 전달
  void removeSong(Song song) {
    songs.remove(song);
  }

//List<Song>에 곡 정보 삭제
  int get totalDuration => songs.fold(0, (sum, song) => sum + song.duration);
//songs 의 노래 길이 의 합을 sum에 누적한다.
//sum 의 값을 get totalDuration에 전달
  void shuffle() {
    songs.shuffle();
  }

//shuffle을 사용하여 리스트의 요소를 랜덤으로 섞어서 재 배열한다.
  List<Song> searchByArtist(String artist) {
    return songs
        .where(
            (song) => song.artist.toLowerCase().contains(artist.toLowerCase()))
        .toList();
  }

// songs의 문자열을 전부 소문자로 반환한다.
// song 리스트에서 artist 를 입력받아 해당 가수의 노래를 찾는다.
  void displayPlaylist() {
    print('Playlist: $name');
    //플레이 리스트 의 제목을 출력한다.
    for (var i = 0; i < songs.length; i++) {
      print('${i + 1}. ${songs[i]}');
    }
    //i는 songs.length 객체 수만큼 1씩 증가한다.
    //리스트의 객체 초기값은 0 이므로 i를 출력할때는 +1를 해준다.
    //1. Shape of You
    print(
        'Total duration: ${totalDuration ~/ 60} minutes ${totalDuration % 60} seconds');
    // Total duration: 16 minutes 40 seconds
    // totalDuration 노래의 총시간이 들어있는 변수를 60으로 나누어
    // minutes 과 seconds를 출력한다.
  }
}

void main() {
  var myPlaylist = Playlist('My Favorite Songs');
// 웰컴 메시지 값
//플레이 리스트 제목
  myPlaylist.addSong(Song('Shape of You', 'Ed Sheeran', 235));
  myPlaylist.addSong(Song('Blinding Lights', 'The Weeknd', 200));
  myPlaylist.addSong(Song('Dance Monkey', 'Tones and I', 209));
  myPlaylist.addSong(Song('Someone You Loved', 'Lewis Capaldi', 182));
  myPlaylist.addSong(Song('Watermelon Sugar', 'Harry Styles', 174));

  myPlaylist.displayPlaylist();
// 노래 정보를 전달 한다.
  print('\nSearching for songs by "The Weeknd":');
  var weekndSongs = myPlaylist.searchByArtist('The Weeknd');
  weekndSongs.forEach(print);
//myPlaylist 에서 The Weeknd 노래정보를 찾아 출력한다.
//Searching for songs by "The Weeknd":
//Blinding Lights by The Weeknd
//Total duration: 16 minutes 40 seconds
  myPlaylist.shuffle();
  //리스트의 요소를 랜덤으로 섞고 재 배열한다.
  print('\nAfter shuffling:');
  myPlaylist.displayPlaylist();
  //다음 실행될 노래 정보를 출력한다.
  //After shuffling:
  //Playlist: My Favorite Songs
  //1. Shape of You by Ed Sheeran
  //2. Blinding Lights by The Weeknd
  //3. Dance Monkey by Tones and I
  //4. Someone You Loved by Lewis Capaldi
  //5. Watermelon Sugar by Harry Styles
}
