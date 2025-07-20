import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit({this.weatherModel}) : super(InitialState());
  WeatherModel? weatherModel;
  getweather({required String cityName}) async {
    try {
      // ignore: unused_local_variable
      WeatherModel weatherModel =
          await WeatherServices().getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFaliureState());
    }
  }
}
