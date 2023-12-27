part of 'home_bloc.dart';

sealed class HomeEvent {}

final class CountrySelected extends HomeEvent {
  final Country country;

  CountrySelected({required this.country});
}

final class ColorLoaded extends HomeEvent {
  final Color color;
  ColorLoaded(this.color);
}
