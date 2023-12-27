import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:radio_app/repositories/radios/radio_repository.dart';
import '../../../common/models/country.dart';
import '../../../injection/locator.dart';
import '../../../repositories/radios/models/radio.dart';
import 'package:logger/logger.dart';
part 'home_event.dart';
part 'home_state.dart';

final logger = Logger();

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IRadioRepository _radioRepository = locator<IRadioRepository>();
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      switch (event) {
        case CountrySelected():
          emit(state.copyWith(status: Status.loading, radios: []));
          final result = await _radioRepository.getRadios(countryCode: event.country.isoCode);
          result.fold((l) {
            emit(state.copyWith(status: Status.initial));
            logger.e('Error retrieving radios: ${l.message}');
          }, (radios) => emit(state.copyWith(status: Status.loaded, countrySelected: event.country, radios: radios)));

        case ColorLoaded():
          emit(state.copyWith(gradientColor: event.color));
      }
    });
  }

  Future<Color> fetchImage(AppRadio radio, NetworkImage networkImage) async {
    final random = Random();
    final fallbackColor = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    if (radio.favicon == '') {
      return fallbackColor;
    }

    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      networkImage,
      size: const Size(300, 300),
    ).timeout(const Duration(seconds: 1), onTimeout: () {
      return PaletteGenerator.fromColors([PaletteColor(fallbackColor, 1)]);
    });
    return paletteGenerator.colors.first;
  }
}
