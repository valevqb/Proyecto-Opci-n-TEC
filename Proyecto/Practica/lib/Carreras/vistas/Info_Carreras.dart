import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Carreras/modelos/Carrera.dart';
import 'package:untitled/Carreras/modelos/usuario.dart';
import 'package:untitled/Carreras/servicios/datos_carrera.dart';
import 'package:provider/provider.dart';

import '../../locators.dart';

class InformacionCarrera extends StatefulWidget {
  final DataCarrera carreraSeleccionado;
  InformacionCarrera(this.carreraSeleccionado);

  @override
  _InformacionCarreraState createState() => _InformacionCarreraState();
}

class _InformacionCarreraState extends State<InformacionCarrera> {
  late DataCarrera _valor;

  @override
  void initState() {
    super.initState();
    _valor = this.widget.carreraSeleccionado;
    locator<DatosCarrera>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = Provider.of<DatosCarrera>(context).isLoading;
    return MaterialApp(
        home: Scaffold(
        body: (isLoading)
            ? Container(

        )
            : SingleChildScrollView(
            child: Column(
                children: [
                  tituloImagenPrincipal(context),
                  Container( //Lista
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                                ),
                                child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 1,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Align(
                                        alignment: Alignment.topLeft,
                                        child: informacionServicio(context),
                                      );
                                    }
                                ),
                              ),
                          ]
                      ),
                    ),
            )
        );
  }

  Widget tituloImagenPrincipal (BuildContext context) { //titulo de la pagina e imagen
    return Container( //La imagen donde dice servicios
      height: 286,
      width: (MediaQuery.of(context).size.width),
      decoration: const BoxDecoration(
        color: Color(0xFF2B436D),
      ),
      child: Image.network( // Imagen del servicio
        _valor.IMG.toString(),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget informacionText (BuildContext context, texto){
    return Container(
        padding: const EdgeInsets.only(
        top: 4, left: 24, right: 24
        ),
        child:Text (texto.toString(), //Labor del servicio
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xFF2B436D))
        )
    );
  }

  Widget informacionTextListaLista (BuildContext context, texto){
    //print(texto?[0].Nombre.toString());
    return Container(
        child: SizedBox( //lista de los tipos de servicios
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: texto.length,
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                  top: 4, left: 24, right: 24
                              ),
                              margin: const EdgeInsets.only(top: 16.0),
                              child: Text (texto[index].Nombre.toString(), //Labor del servicio
                              style: const TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2B436D))
                          )
                        ),
                          Container(
                            child: informacionTextLista(context, (texto[index].Opciones)),
                          )
                      ])
                  );
                })
        ));
  }

  Widget informacionTextLista (BuildContext context, texto){
    return Container(
        padding: const EdgeInsets.only(
            top: 4, left: 24, right: 24
        ),
        child: SizedBox( //lista de los tipos de servicios
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: texto.length,
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                      alignment: Alignment.topLeft,
                        child: Container(
                            child: Text (texto[index].toString(), //Labor del servicio
                                style: const TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF2B436D))
                            )
                        )
                  );
            })
        ));
  }

  Widget subtitulo (BuildContext context, texto){
    return Container(
        padding: const EdgeInsets.only(
        top: 24, left: 24, right: 24
        ),
        child: Text (texto.toString(), //Labor del servicio
          style: const TextStyle(
              fontFamily: 'Mulish',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2B436D)),
        )
    );
  }

  Widget titulos (BuildContext context, texto){
    return Container(
        padding: const EdgeInsets.only(
        top: 30.75, left: 24, right: 24
        ),
        child: Text (texto.toString(), //Nombre del servicio
          style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight. bold,
              color: Color(0xFFB2B436D)),
        )
    );
  }

  Widget informacionServicio (BuildContext context){ //list users son las imagenes, carga la info de los servicios
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titulos(context, _valor.Nombre),
          subtitulo(context, "Sede"),
          informacionText(context, _valor.Sede),
          subtitulo(context, "Grado"),
          informacionText(context, _valor.Grado),
          subtitulo(context, "Horario"),
          informacionText(context, _valor.Horario),
          subtitulo(context, "Corte"),
          informacionText(context, _valor.Corte),
          subtitulo(context, "Descripción"),
          informacionText(context, _valor.Descripcion),
          subtitulo(context, "Acreditación"),
          informacionText(context, _valor.Acreditacion),
          titulos(context, "Perfil del estudiante"),
          subtitulo(context, "Intereses"),
          informacionTextLista(context, _valor.Intereses),
          subtitulo(context, "Habilidades"),
          informacionTextLista(context, _valor.Habilidades),
          titulos(context, "Area laboral"),
          informacionTextListaLista(context, _valor.AreaLaboral?.areas),
          titulos(context, "Plan de Estudios"),
        ]
    );
  }
}
