
import 'package:untitled/models/daily.dart';
import 'package:untitled/models/hourly.dart';

class Forecast {
  List<Hourly>? hourly;
  List<Daily>? daily;

  Forecast({this.hourly, this.daily});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<dynamic> hourlyData = json['hourly'];
    List<dynamic> dailyData = json['daily'];

    List<Hourly> hourly = <Hourly>[];
    List<Daily> daily = <Daily>[];

    hourlyData.forEach((item) {
      var hour = Hourly.fromJson(item);
      hourly.add(hour);
    });

    dailyData.forEach((item) {
      var day = Daily.fromJson(item);
      daily.add(day);
    });

    return Forecast(
        hourly: hourly,
        daily: daily
    );
  }
}