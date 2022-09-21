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
  Destino? Destinos;
  DataServicioBus({this.Origen, this.Destinos});

  DataServicioBus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Origen = json['info']['Origen'];
    Destinos = Destino.fromJson(json['info']['Destino']);
    //print(Destinos?.destinos?.toString())//[0].Nombre);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ 'id' ] = id;
    data[ 'Origen' ]= Origen;
    data[ 'Destino' ] = Destinos;
    return data;
  }
}

class Destino {
  List<DataDestino>? destinos = [];
  int? total;

  Destino();

  Destino.fromJson(List<dynamic> json) {
    if(json.isNotEmpty) {
      json.forEach((v) {
        destinos!.add(new DataDestino.fromJson(v));
      });
    }
  }
}

class DataDestino {
  String? Nombre;
  String? Precio;
  String? Ubicacion;
  List<dynamic>? Horarios;
  List<dynamic>? Paradas;
  DataDestino({this.Nombre, this.Precio, this.Ubicacion, this.Horarios , this.Paradas});

  DataDestino.fromJson(Map<String, dynamic> json) {
    Nombre = json['Nombre'];
    Precio = json['Precio'];
    Ubicacion = json['Ubicacion'];
    Horarios = json['Horarios'];
    Paradas = json['Paradas'];

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data[ 'Nombre' ] = Nombre;
      data[ 'Precio' ] = Precio;
      data[ 'Ubicacion' ] = Ubicacion;
      data[ 'Horarios' ] = Horarios;
      data[ 'Paradas' ] = Paradas;
      return data;
    }
  }
}
