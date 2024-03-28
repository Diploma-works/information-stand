import 'package:flutter/material.dart';
import 'package:information_stand/features/weather/models/weather/weather_model.dart';
import 'package:information_stand/features/weather/presentation/widgets/weather_widget.dart';

class TodayWeather extends StatelessWidget {
  List<WeatherModel> weather;

  TodayWeather({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return WeatherWidget(weather: weather[index + 1]);
          }),
    );
  }
}
