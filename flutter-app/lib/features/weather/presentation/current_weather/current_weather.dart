import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/weather/models/weather/weather_model.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';

class CurrentWeather extends StatelessWidget {
  WeatherModel weather;
  String city;

  CurrentWeather({super.key, required this.weather, required this.city});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: context.style.padding.small,
              child: Text(
                " $city",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Image(
              image: NetworkImage(
                  "https://openweathermap.org/img/wn/${weather.weather.first.icon.replaceAll('n', 'd')}@2x.png"),
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                Text(
                  weather.main.temp_max != weather.main.temp_min
                      ? "${"${weather.main.temp_max.toInt()}\u00B0"}/${weather.main.temp_min.toInt().toString()}"
                          "\u00B0"
                      : "${weather.main.temp_max.toInt()}\u00B0",
                  style: const TextStyle(
                      fontSize: 70, fontWeight: FontWeight.bold),
                ),
                Text(weather.weather.first.description,
                    style: const TextStyle(
                      fontSize: 30,
                    )),
                Text(formatDate(weather.dt_txt),
                    style: const TextStyle(
                      fontSize: 25,
                    ))
              ],
            )
          ],
        )
      ],
    );
  }
}

String formatDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);

  DateFormat formatter = DateFormat('dd MMMM yyyy', 'en_US');

  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}
