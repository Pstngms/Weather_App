class Hourly {
  int? dt;
  double? temp;
  double? feelsLike;
  double? pressure;
  double? dewPoint;
  double? uvi;
  double? visibility;
  double? wind;
  String? description;
  String? icon;

  Hourly({this.dt, this.temp, this.feelsLike, this.pressure, this.dewPoint, this.uvi, this.visibility, this.wind, this.description, this.icon});

  Hourly.fromJson(Map<String, dynamic> json) {

      dt= json['dt'].toInt();
      temp= json['temp'].toDouble();
      feelsLike= json['feels_like'].toDouble();
      pressure= json['pressure'].toDouble();
      dewPoint=json['dew_point'].toDouble();
      uvi= json['uvi'].toDouble();
      visibility= json['visibility'].toDouble();
      wind= json['wind_speed'].toDouble();
      description= json['weather'][0]['description'];
      icon= json['weather'][0]['icon'];

  }
}