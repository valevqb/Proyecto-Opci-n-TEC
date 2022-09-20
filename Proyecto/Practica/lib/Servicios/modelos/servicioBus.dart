class ServicioBus {
  List<DataServicioBus>? servicioBus = [];
  int? total;

  ServicioBus();

  ServicioBus.fromJson(Map<String, dynamic> json) {
    total = json['Cantidad'];
    if (json['Datos'] != null) {
      servicioBus = [];
      json['Datos'].forEach((v) {
        servicioBus!.add(new DataServicioBus.fromJson(v));
      });
    }

  }
}

class DataServicioBus {
  int? id;
  String? Origen;
  DataDestino? Destinos;
  DataServicioBus({this.Origen, this.Destinos});

  DataServicioBus.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    Origen= json['info']['Origen'];
    Destinos = DataDestino.fromJson(json['info']['Destino']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ 'id' ] = id;
    data[ 'Origen' ]= Origen;
    data[ 'Destino' ] = Destinos;
    return data;
  }
}

class DataDestino {
  String? Destino;
  List<dynamic>? Precio;
  List<dynamic>? Ubicacion;
  List<dynamic>? Horarios;
  List<dynamic>? Paradas;
  DataDestino({this.Destino, this.Precio, this.Ubicacion, this.Horarios , this.Paradas});

  DataDestino.fromJson(Map<String, dynamic> json) {
    Destino = json['info']['Destino'];
    Precio = json['info']['Precio'];
    Ubicacion = json['info']['Ubicacion'];
    Horarios = json['info']['Horarios'];
    Paradas = json['info']['Paradas'];

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data[ 'Destino' ] = Destino;
      data[ 'Precio' ] = Precio;
      data[ 'Ubicacion' ] = Ubicacion;
      data[ 'Horarios' ] = Horarios;
      data[ 'Paradas' ] = Paradas;
      return data;
    }
  }
}
