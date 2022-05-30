import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/city_repository.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit(this.cityRepository) : super(CitiesInitial()) {
    fetchCities();
  }

  final CityRepository cityRepository;


  Future<void> fetchCities() async {
    emit(CitiesLoading());
    try {
      await cityRepository.fetchCities().then((cities) {
        emit(CitiesLoaded(cities: cities));
      });
    } on DioError catch (e) {
      emit(CitiesFailed(message: e.toString()));
    }

  }
}
