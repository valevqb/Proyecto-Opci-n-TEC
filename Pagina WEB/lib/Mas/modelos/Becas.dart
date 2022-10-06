class Becas {
  int? total;
  List<List<DataBecas>>? becas;

  Becas();

  Becas.fromJson(Map<String, dynamic> json) {
    total = json['Cantidad'];
    List<DataBecas> estimulo = [];
    List<DataBecas> Sociecionomica = [];
    if (json['Datos'] != null) {
      becas = [];
      json['Datos'].forEach((v) {
        if(v['info']['Categoria']=="Socioeconomica"){
          Sociecionomica.add(new DataBecas.fromJson(v));
        }else {
          estimulo.add(new DataBecas.fromJson(v));
        }
        });

      becas?.add(Sociecionomica);
      becas?.add(estimulo);
    }


    becas!.forEach((v) {
      v.forEach((e) {
        print(e.Nombre);
      });
    });


  }
}

class DataBecas {
  String? Nombre;
  String? Categoria;
  String? Descripcion;
  List<dynamic>? Requisitos;
  List<dynamic>? Beneficios;
  int? id;

  DataBecas(
      {this.Nombre,
      this.Categoria,
      this.Descripcion,
      this.Requisitos,
      this.Beneficios});

  DataBecas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Nombre = json['info']['Nombre'];
    Categoria = json['info']['Categoria'];
    Descripcion = json['info']['Descripcion'];
    Requisitos = json['info']['Requisitos'];
    Beneficios = json['info']['Beneficios'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['Nombre'] = Nombre;
    data['Categoria'] = Categoria;
    data['Descripcion'] = Descripcion;
    data['Requisitos'] = Requisitos;
    data['Beneficios'] = Beneficios;
    return data;
  }
}
