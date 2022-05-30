part of 'cities_cubit.dart';

@immutable
abstract class CitiesState {}

class CitiesInitial extends CitiesState {}

class CitiesLoading extends CitiesState {}

class CitiesFailed extends CitiesState {
  final String message;

  CitiesFailed({required this.message});
}

class CitiesLoaded extends CitiesState {
  final List<dynamic> cities;

  CitiesLoaded({required this.cities});
}