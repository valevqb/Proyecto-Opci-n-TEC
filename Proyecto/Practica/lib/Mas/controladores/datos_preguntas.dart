import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:untitled/Mas/modelos/Preguntas.dart';
import 'package:http/http.dart' as http;

class DatosPreguntas extends ChangeNotifier {
  String userUrl = 'http://localhost:3000/api/preguntas';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<DatosPreguntas>? preguntas = [];


  Future<List<DatosPreguntas>?> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(userUrl)).catchError((e) {
      print("Error Fetching Users" + e.toString());
    });


    if(result.statusCode == 200){
      Map<String, dynamic> _datos = json.decode(result.body);

      var _preguntas = _datos["Datos"];

      if (_preguntas != null) {
        preguntas = Preguntas.fromJson(_datos).datos;
      }

      _isLoading = false;
      notifyListeners();
      return preguntas;
    }
    else{
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }


  }
}