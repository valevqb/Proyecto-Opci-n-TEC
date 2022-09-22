class Servicios {
  List<List<DataServicio>>? servicios = [];
  int? total;

  Servicios();

  Servicios.fromJson(Map<String, dynamic> json) {
    total = json['Cantidad'];
    List<DataServicio> facilidades = [];
    List<DataServicio> saludBienestar = [];
    List<DataServicio> estudio = [];
    List<DataServicio> masServicios = [];
    if (json['Datos'] != null) {
      servicios = [];
      json['Datos'].forEach((v) {
        if(v['info']['Categoria'] == "Facilidades"){
          facilidades.add(new DataServicio.fromJson(v));
        } else if(v['info']['Categoria'] == "Salud y Bienestar"){
          saludBienestar.add(new DataServicio.fromJson(v));
        } else  if(v['info']['Categoria'] == "Para el estudio"){
          estudio.add(new DataServicio.fromJson(v));
        } else{
          masServicios.add(new DataServicio.fromJson(v));
        }
      });
      servicios?.add(facilidades);
      servicios?.add(saludBienestar);
      servicios?.add(estudio);
      servicios?.add(masServicios);


    }
    servicios!.forEach((v) {
      v.forEach((e) {
        print(e.Nombre);
      });
    });


  }
}

class DataServicio {
  int? id;
  String? Nombre;
  String? Categoria;
  String? Descripcion;
  String? Precio;
  List<dynamic>? Ubicacion;
  List<dynamic>? Horarios;
  List<dynamic>? Fotos;
  DataServicio({this.Nombre, this.Categoria, this.Descripcion, this.Precio, this.Ubicacion, this.Horarios, this.Fotos});

  DataServicio.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    Nombre = json['info']['Nombre'];
    Categoria = json['info']['Categoria'];
    Descripcion = json['info']['Descripcion'];
    Precio = json['info']['Precio'];
    Ubicacion = json['info']['Ubicacion'];
    Horarios = json['info']['Horarios'];
    Fotos = json['info']['IMG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ 'id' ] = id;
    data[ 'Nombre' ] = Nombre;
    data[ 'Categoria' ] = Categoria;
    data[ 'Descripcion' ] = Descripcion;
    data[ 'Precio' ] = Precio;
    data[ 'Ubicacion' ] = Ubicacion;
    data[ 'Horarios' ] = Horarios;
    data[ 'IMG' ] = Fotos;
    return data;
  }
}
