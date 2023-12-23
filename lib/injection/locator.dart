import 'package:get_it/get_it.dart';
import 'package:radio_app/repositories/radios/radio_repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerLazySingleton<IRadioRepository>(() => RadioRepository());
}
