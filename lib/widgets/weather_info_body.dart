import 'package:flutter/material.dart';

import 'package:weather_app/models/weather_model.dart';

// ignore: must_be_immutable
class WeatherInfoBody extends StatelessWidget {
  WeatherInfoBody({Key? key, required this.weatherModel}) : super(key: key);
  WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    // WeatherModel weatherModel =
    //     BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            'updated at : ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https:${weatherModel.image}",
              ),
              Text(
                weatherModel.avgTemp!.round().toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Maxtemp: ${weatherModel.maxTemp?.round()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Mintemp: ${weatherModel.minTemp?.round()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            weatherModel.state,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
