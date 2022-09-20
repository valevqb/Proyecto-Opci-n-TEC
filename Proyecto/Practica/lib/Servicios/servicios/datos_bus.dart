import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:untitled/Servicios//modelos/servicioBus.dart';
import 'package:http/http.dart' as http;

class DatosBus extends ChangeNotifier {
  String userUrl = 'http://10.147.19.78:3000/api/Buses';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<DataServicioBus>? buses = [];

  Future<List<DataServicioBus>?> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(userUrl)).catchError((e) {
      print("Error Fetching Users" + e.toString());
    });


    if(result.statusCode == 200){
      Map<String, dynamic> _datos = json.decode(result.body);

      var _buses = _datos["Datos"];

      if (_buses != null) {
        buses = ServicioBus.fromJson(_datos).servicioBus;
      }

      _isLoading = false;
      notifyListeners();
      return buses;
    }
    else{
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }


  }
}