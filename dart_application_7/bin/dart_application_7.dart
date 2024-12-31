class WeatherCondition {
  String description;
  double temperature;
  int humidity;
//문자열 타입 description
//소수 타입 temperature
//정수 타입 humidity
//변수 선언
  WeatherCondition(this.description, this.temperature, this.humidity);
// 전역 변수 선언
  void display() {
    print('날씨: $description');
    print('온도: ${temperature.toStringAsFixed(1)}°C');
    print('습도: $humidity%');
  }
}

//날씨: 맑음
//온도: 28.5 °C
//습도: 65
class WeatherForecast {
  List<WeatherCondition> forecast = [];
// 클래스 WeatherForecast 생성
// 예보 정보가 전달 될 WeatherCondition 생성

  void addForecast(WeatherCondition condition) {
    forecast.add(condition);
    print('날씨 예보가 추가되었습니다.');
  }

// forecast 변수에 날씨를 전달 하고
// 날씨 예보가 추가되었습니다. 출력
  void displayForecast() {
    if (forecast.isEmpty) {
      print('예보 정보가 없습니다.');
      //forecast 에 입력한 정보가 없다면
      //예보 정보가 없습니다 출력
    } else {
      for (var i = 0; i < forecast.length; i++) {
        print('\n${i + 1}일 후 날씨:');
        forecast[i].display();
      }
    }
  } //i는 forecast 리스트에 있는 객체의 수 만큼 1씩 증가한다

//forecast 리스트의 객체 값의 시작은 0 이기 때문에
// \n${i + 1}일 후 날씨: 출력시 i 값에 +1를 해준다.
  WeatherCondition? findHottestDay() {
    if (forecast.isEmpty) return null;
    return forecast.reduce(
        (curr, next) => curr.temperature > next.temperature ? curr : next);
  }

//temperature를 비교하여 가장 높은 최대 값을 findHottestDay에 전달한다.
//온도의 최대값임
  double getAverageTemperature() {
    if (forecast.isEmpty) return 0;
    var sum = 0.0;
    for (var condition in forecast) {
      sum += condition.temperature;
    }
    return sum / forecast.length;
  }
}

//temperature를 sum에 누적하여 더하고
//forecast 리스트 의 객체 수 만큼을 나누어 평균기온을 계산한다.
//getAverageTemperature 변수에 전달한다.
void main() {
  var weatherSystem = WeatherForecast();

  weatherSystem.addForecast(WeatherCondition('맑음', 28.5, 65));
  weatherSystem.addForecast(WeatherCondition('흐림', 25.0, 80));
  weatherSystem.addForecast(WeatherCondition('비', 22.8, 90));
// Forecast 리스트에 입력한 예보 의 값
  weatherSystem.displayForecast();

  var hottestDay = weatherSystem.findHottestDay();
  if (hottestDay != null) {
    print('\n가장 더운 날:');
    hottestDay.display();
  }
// 온도의 최대값을 가지고 있는 findHottestDay 를 호출하여 hottestDay에 전달하고
// 가장 더운날 : 3일 후의 날씨: 비
  print(
      '\n평균 기온: ${weatherSystem.getAverageTemperature().toStringAsFixed(1)}°C');
}
// 평균 기온: 25.4 °C
