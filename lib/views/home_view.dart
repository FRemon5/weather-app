import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: getThemeColor(
              BlocProvider.of<GetWeatherCubit>(context).weatherModel?.state),
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }));
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          if (state is InitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(weatherModel: state.weatherModel);
          } else {
            return const Text('Error');
          }
        }));
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.amber; // Bright yellow/orange for sunny weather

    case 'Partly cloudy':
      return Colors.orange;

    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;

    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.indigo;

    case 'Patchy snow possible':
    case 'Light snow':
    case 'Heavy snow':
    case 'Snow':
    case 'Patchy light snow':
    case 'Moderate snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue;

    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.teal;

    case 'Freezing drizzle':
    case 'Patchy freezing drizzle possible':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.cyan;

    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;

    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.deepOrange;

    case 'Blowing snow':
    case 'Blizzard':
      return Colors.blue;

    default:
      return Colors.blue; // Default theme for unrecognized conditions
  }
}
