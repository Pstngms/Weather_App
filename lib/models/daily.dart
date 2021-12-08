class Daily {
  int? dt;
  double? temp;
  double? feelsLike;
  double? low;
  double? high;
  String? description;
  double? pressure;
  double? humidity;
  double? wind;
  String? icon;

  Daily({this.dt, this.temp, this.feelsLike, this.low, this.high, this.description, this.pressure, this.humidity, this.wind, this.icon});

  Daily.fromJson(Map<String, dynamic> json) {

      dt= json['dt'].toInt();
      temp= json['temp']['day'].toDouble();
      feelsLike= json['feels_like']['day'].toDouble();
      low= json['temp']['min'].toDouble();
      high= json['temp']['max'].toDouble();
      description= json['weather'][0]['description'];
      pressure= json['pressure'].toDouble();
      humidity= json['humidity'].toDouble();
      wind= json['wind_speed'].toDouble();
      icon= json['weather'][0]['icon'];

  }
}