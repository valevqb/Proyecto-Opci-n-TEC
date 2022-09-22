import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:untitled/Carreras/modelos/Carrera.dart';
import 'package:http/http.dart' as http;
import '';
import '../../Config.dart';
class DatosCarrera extends ChangeNotifier {


  String userUrl = Config.dirServer+'carreras';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<DataCarrera>? carreras = [];


  Future<List<DataCarrera>?> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(userUrl)).catchError((e) {
      print("Error Fetching Users" + e.toString());
    });


    if(result.statusCode == 200){
      Map<String, dynamic> _datos = json.decode(result.body);

      var _carreras = _datos["Datos"];

      if (_carreras != null) {
        carreras = Carreras.fromJson(_datos).datos;
      }

      _isLoading = false;
      notifyListeners();
      return carreras;
    }
    else{
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }


  }
}