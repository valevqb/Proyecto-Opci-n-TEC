import 'package:get_it/get_it.dart';
import 'package:untitled/Mas/controladores/datos_costos.dart';
import 'package:untitled/Mas/controladores/datos_preguntas.dart';
import 'package:untitled/Mas/controladores/datos_becas.dart';
import 'package:untitled/Servicios/servicios/datos_bus.dart';
import 'package:untitled/Servicios/servicios/datos_servicio.dart';

import 'Carreras/servicios/datos_carrera.dart';

 var  ServerDir="10.147.19.78:3000";
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
  locator.registerLazySingleton<DatosPreguntas>(
        () => DatosPreguntas(),
  );
  locator.registerLazySingleton<DatosBecas>(
        () => DatosBecas(),
  );
  locator.registerLazySingleton<DatosCostos>(
        () => DatosCostos(),
  );
  locator.registerLazySingleton<DatosBus>(
        () => DatosBus()
  );
}