import 'package:get_it/get_it.dart';
import 'package:opciontec/Admision/controladores/datos_Admision.dart';
import 'package:opciontec/Calendario/controladores/datos_eventos.dart';
import 'package:opciontec/Mas/controladores/datos_costos.dart';
import 'package:opciontec/Mas/controladores/datos_preguntas.dart';
import 'package:opciontec/Mas/controladores/datos_becas.dart';
import 'package:opciontec/Servicios/servicios/datos_bus.dart';
import 'package:opciontec/Servicios/servicios/datos_servicio.dart';
import 'package:opciontec/Calendario/controladores/datos_eventos.dart';

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
  locator.registerLazySingleton<DatosPreguntas>(
    () => DatosPreguntas(),
  );
  locator.registerLazySingleton<DatosBecas>(
    () => DatosBecas(),
  );
  locator.registerLazySingleton<DatosCostos>(
    () => DatosCostos(),
  );
  locator.registerLazySingleton<DatosBus>(() => DatosBus());
  locator.registerLazySingleton<DatosAdmisiones>(() => DatosAdmisiones());
  locator.registerLazySingleton<DatosEventos>(() => DatosEventos());
}
