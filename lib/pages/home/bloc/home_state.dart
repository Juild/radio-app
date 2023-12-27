part of 'home_bloc.dart';

enum Status { initial, loading, loaded }

class HomeState extends Equatable {
  final Status status;
  final Country? countrySelected;
  final List<AppRadio> radios;
  final List<Color> colors;
  final Color gradientColor;

  const HomeState(
      {this.gradientColor = Colors.red,
      this.status = Status.initial,
      this.countrySelected,
      this.radios = const [],
      this.colors = const []});

  HomeState copyWith({
    Status? status,
    Country? countrySelected,
    List<AppRadio>? radios,
    List<Color>? colors,
    Color? gradientColor,
  }) {
    return HomeState(
      status: status ?? this.status,
      countrySelected: countrySelected ?? this.countrySelected,
      radios: radios ?? this.radios,
      colors: colors ?? this.colors,
      gradientColor: gradientColor ?? this.gradientColor,
    );
  }

  @override
  List<Object?> get props => [countrySelected, radios, status, gradientColor];
}
