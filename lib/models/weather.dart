import 'dart:developer';

class Current {
  double? temp;

  Current(this.temp);

  Current.fromJson(Map<String, dynamic> json) {
    temp = json['current']['temp'];
  }
}

class Hourly {
  double? temp;
  double? time;
  String? img;

  Hourly(this.temp, this.time, this.img);

  factory Hourly.fromJson(Map<String, dynamic> json) {
    log('message');
    return Hourly(
        json['temp'] as double?,
        json['dt'] as double?,
        json['weather'][0]['main'] as String?
      // null,
      // null,
      // null,
    );
  }
}
