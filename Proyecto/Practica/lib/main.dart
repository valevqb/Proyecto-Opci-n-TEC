import 'package:flutter/material.dart';
//import 'Pez1_Screen.dart';
import 'Barra.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'locators.dart';
import 'Carreras/services/user_data_service.dart';

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
        ChangeNotifierProvider(create: (_) => locator<UserDataService>()),
      ],
      child: PrototipoBarra(),
    ),
  );

}
