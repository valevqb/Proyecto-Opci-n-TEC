import 'package:get_it/get_it.dart';
import 'package:untitled/Servicios/servicios/datos_servicio.dart';

import 'Carreras/servicios/datos_carrera.dart';


/// Locators to get instances of classes mostly singletons
GetIt locator = GetIt.I;

/// needs to be called at in the main
/// it creates the instances of servicios
void setupLocators() {
  locator.registerLazySingleton<DatosCarrera>(
        () => DatosCarrera(),
  );
  locator.registerLazySingleton<DatosServicio>(
        () => DatosServicio(),
  );
}