<<<<<<< Updated upstream
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:untitled/Servicios//modelos/servicioBus.dart';
import 'package:http/http.dart' as http;

import '../../Config.dart';

class DatosBus extends ChangeNotifier {
  String userUrl = Config.dirServer+'Buses';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<dynamic>? servicioBus = [];

  Future<List<dynamic>?> fetchServicioBus() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(userUrl)).catchError((e) {
      print("Error Fetching Users" + e.toString());
    });


    if(result.statusCode == 200){
      Map<String, dynamic> _datos = json.decode(result.body);

      var _buses = _datos["Datos"];

      if (_buses != null) {
        servicioBus = ServicioBus.fromJson(_datos).servicioBus;
        print("0000000");
      }

      _isLoading = false;
      notifyListeners();
      return servicioBus;
    }
    else{
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }


  }
=======
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:opciontec/Servicios//modelos/servicioBus.dart';
import 'package:http/http.dart' as http;

import '../../Config.dart';

class DatosBus extends ChangeNotifier {
  String userUrl = Config.dirServer+'Buses';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<dynamic>? servicioBus = [];

  Future<List<dynamic>?> fetchServicioBus() async {
    _isLoading = true;
    notifyListeners();

    final result = await http.get(Uri.parse(userUrl)).catchError((e) {
      print("Error Fetching Users" + e.toString());
    });


    if(result.statusCode == 200){
      Map<String, dynamic> _datos = json.decode(result.body);

      var _buses = _datos["Datos"];

      if (_buses != null) {
        servicioBus = ServicioBus.fromJson(_datos).servicioBus;

      }

      _isLoading = false;
      notifyListeners();
      return servicioBus;
    }
    else{
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }


  }
>>>>>>> Stashed changes
}