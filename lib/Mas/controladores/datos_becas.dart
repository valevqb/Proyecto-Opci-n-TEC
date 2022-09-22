import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/physics.dart';
import 'package:untitled/Mas/modelos/Becas.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Config.dart';
class DatosBecas extends ChangeNotifier {
  String userUrl = Config.dirServer+'becas';

  bool _isLoading = false;

  bool get isLoading => _isLoading;


  List<List<DataBecas>>? becas = [];


  Future<List<List<DataBecas>>?> fetchUsers() async {
    _isLoading = true;
    notifyListeners();
    print(userUrl);
    final result = await http.get(Uri.parse(userUrl)).catchError((e) {
      print("Error Fetching Users" + e.toString());
    });


    if(result.statusCode == 200){
      Map<String, dynamic> _datos = json.decode(result.body);

      var _becas = _datos["Datos"];

      if (_becas != null) {
        becas = Becas.fromJson(_datos).becas;
      }

      _isLoading = false;
      notifyListeners();
      return becas;
    }
    else{
      _isLoading = false;
      notifyListeners();
      throw Exception('Error - ${result.statusCode}');
    }


  }
}