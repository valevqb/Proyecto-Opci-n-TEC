import 'package:flutter/material.dart';
import 'package:opciontec/Mas/controladores/datos_becas.dart';
import 'package:opciontec/Mas/controladores/datos_costos.dart';
import 'package:opciontec/Mas/controladores/datos_preguntas.dart';
import 'package:opciontec/Servicios/servicios/datos_bus.dart';
import 'package:opciontec/Servicios/servicios/datos_servicio.dart';
import 'Admision/controladores/datos_Admision.dart';
import 'Barra.dart';
import 'package:opciontec/Sesion/vistas/login.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'locators.dart';
import 'Carreras/servicios/datos_carrera.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ///Set preferred orientation to portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupLocators();
  runApp(
    MultiProvider(
      /// List of provider, the UI updates when `notifyListeners()` is called
      /// on the service classes
      /// learn more: https://pub.dev/packages/provider
      providers: [
        ChangeNotifierProvider(create: (_) => locator<DatosCarrera>()),
        ChangeNotifierProvider(create: (_) => locator<DatosServicio>()),
        ChangeNotifierProvider(create: (_) => locator<DatosPreguntas>()),
        ChangeNotifierProvider(create: (_) => locator<DatosBecas>()),
        ChangeNotifierProvider(create: (_) => locator<DatosCostos>()),
        ChangeNotifierProvider(create: (_) => locator<DatosBus>()),
        ChangeNotifierProvider(create: (_) => locator<DatosAdmisiones>()),
      ],
      child: MaterialApp(home: LogIn()),
    ),
  );
}
