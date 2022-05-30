import 'package:dio/dio.dart';
import 'package:dio_cubit/common/api_client.dart';
import 'package:flutter/material.dart';

class CityProvider {
  final ApiClient _apiClient;

  CityProvider(this._apiClient);
  
  Future<List<dynamic>> fetchCities() async {
      Response response = await _apiClient.dio.get("/citygfd.json");
      print(response.data);
      return response.data;
  }
}