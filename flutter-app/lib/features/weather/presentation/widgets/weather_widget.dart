import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:information_stand/features/weather/models/weather/weather_model.dart';
import 'package:information_stand/ui/theme/extensions/main_theme/main_theme_extension.dart';

class WeatherWidget extends StatefulWidget {
  WeatherModel weather;

  WeatherWidget({super.key, required this.weather});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(35), color: Colors.white54),
      child: Column(
        children: [
          Text(
            widget.weather.weather.first.description,
            style: const TextStyle(fontSize: 23),
          ),
          const SizedBox(
            height: 2,
          ),
          Image(
            image: NetworkImage(
              "https://openweathermap.org/img/wn/${widget.weather.weather.first.icon.replaceAll('n', 'd')}@2x.png",
            ),
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            widget.weather.main.temp_max != widget.weather.main.temp_min
                ? "${"${widget.weather.main.temp_max.toInt()}\u00B0"}/${widget.weather.main.temp_min.toInt().toString()}"
                    "\u00B0"
                : "${widget.weather.main.temp_max.toInt()}\u00B0",
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            formatDate(widget.weather.dt_txt),
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }

  String formatDate(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);

    DateFormat formatter = DateFormat('dd MMMM yyyy', 'en_US');

    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }
}
