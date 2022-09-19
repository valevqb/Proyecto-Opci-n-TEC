class Carreras {
  List<DataCarrera>? datos;
  int? total;

  Carreras();

  Carreras.fromJson(Map<String, dynamic> json) {
    total = json['Cantidad'];
    if (json['Datos'] != null) {
      datos = [];
      json['Datos'].forEach((v) {
        datos!.add(new DataCarrera.fromJson(v));
      });
    }

  }
  /*
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.support != null) {
      data['support'] = this.support!.toJson();
    }
    return data;
  }*/
}

class DataCarrera {
  String? Acreditacion;
  Map<String, dynamic>? Cortes;
  String? Descripcion;
  List<dynamic>? Habilidades;
  String? Horario;
  List<dynamic>? Intereses;
  String? Nombre;
  String? Sede;
  String? IMG;
  int? id;
  DataCarrera({this.Acreditacion, this.Cortes, this.Descripcion, this.Habilidades, this.Horario,this.Intereses,this.Nombre,this.Sede,this.IMG});

  DataCarrera.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    Acreditacion = json['info']['Acreditacion'];
    Cortes = json['info']['Cortes'];
    Descripcion = json['info']['Descripcion'];
    Habilidades= json['info']['Habilidades'];
    Horario = json['info']['Horario'];
    Intereses = json['info']['Intereses'];
    Nombre = json['info']['Nombre'];
    Sede = json['info']['Sede'];
    IMG = json['info']['IMG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ 'id' ] = id;
    data[ 'Acreditacion' ] = Acreditacion;
    data[ 'Cortes' ] = Cortes;
    data[ 'Descripcion' ] = Descripcion;
    data[ 'Habilidades' ]= Habilidades;
    data[ 'Horario' ] = Horario;
    data[ 'Intereses' ] = Intereses;
    data[ 'Nombre' ] = Nombre;
    data[ 'Sede' ] = Sede;
    data[ 'IMG' ] = IMG;
    return data;

  }
}
