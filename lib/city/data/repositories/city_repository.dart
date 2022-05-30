import 'package:dio/dio.dart';

import '../models/city.dart';
import '../services/providers.dart';

class CityRepository {
  final CityProvider cityProvider;

  CityRepository(this.cityProvider);
  Future<List<dynamic>> fetchCities() async {
      final cities = await cityProvider.fetchCities();
      return cities.map((city) => City.fromJson(city)).toList();
  }
}