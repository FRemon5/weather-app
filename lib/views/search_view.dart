import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search City"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: TextField(
          onSubmitted: (value) async {
            var getWeather = BlocProvider.of<GetWeatherCubit>(context);
            getWeather.getweather(cityName: value);
            Navigator.pop(context);
          },
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
            hintText: "Enter City Name",
            labelText: "Search",
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;
