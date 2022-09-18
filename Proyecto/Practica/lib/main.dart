import 'package:flutter/material.dart';
import 'package:untitled/Servicios/servicios/datos_servicio.dart';
//import 'Pez1_Screen.dart';
import 'Barra.dart';
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
      ],
      child: PrototipoBarra(),
    ),
  );

}
