import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:opciontec/Servicios/modelos/servicio.dart';
import 'package:http/http.dart' as http;

import '../../Config.dart';

class DatosServicio extends ChangeNotifier{
  String userUrl = Config.dirServer+'Servicios';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<List<DataServicio>>? servicios = [];

  Future<List<List<DataServicio>>?> fetchServicios() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(userUrl)).catchError((e) {
      print('Error Fetching Users');
    });

    if(result.statusCode == 200){
      Map<String, dynamic> data = json.decode(result.body);

      var _servicios = data["Datos"];

      if (_servicios != null) {
        servicios = Servicios.fromJson(data).servicios;
      }
      _isLoading = false;
      notifyListeners();
      return servicios;
    }
    else{
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }
  }
}
