import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final dio = Dio();
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "e4e9ea98386045d9854162737252306";
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel jsonData = WeatherModel.fromJson(response.data);
      return jsonData;
    } on DioException catch (e) {
      final String errMSG = e.response?.data['error']['message'] ?? 'Error';
      throw Exception(errMSG);
    } catch (e) {
      throw Exception('There was an error');
    }
  }
}
