import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:untitled/Servicios/modelos/servicio.dart';
import 'package:http/http.dart' as http;

class DatosServicio extends ChangeNotifier{
  String userUrl = 'https://reqres.in/api/users';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<DataServicio>? servicios = [];

  Future<List<DataServicio>?> fetchServicios() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(userUrl)).catchError((e) {
      print('Error Fetching Users');
    });

    if(result.statusCode == 200){
      Map<String, dynamic> data = json.decode(result.body);
      var _users = data["data"];
      if (_users != null) {
        servicios = Servicio.fromJson(data).data;
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
