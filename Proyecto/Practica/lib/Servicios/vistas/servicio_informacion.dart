import 'package:flutter/material.dart';
import 'package:untitled/Servicios/modelos/servicio.dart';
import 'package:untitled/Servicios/servicios/datos_servicio.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Servicios/vistas/servicio_inicio.dart';

import '../../locators.dart';

class InformacionServicio extends StatefulWidget {
  @override
  _InformacionServicioState createState() => _InformacionServicioState();
}

class _InformacionServicioState extends State<InformacionServicio> {

  @override
  void initState() {
    super.initState();
    locator<DatosServicio>().fetchServicios();
  }

  @override
  Widget build(BuildContext context) {
    List<DataServicio>? users = Provider.of<DatosServicio>(context).servicios;
    bool isLoading = Provider.of<DatosServicio>(context).isLoading;
    return Scaffold(
      body: (isLoading)
          ? Container(

        )
          : Container(
            child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container( //La imagen donde dice servicios
                        height: 286,
                        width: (MediaQuery.of(context).size.width),
                        padding: EdgeInsets.only(
                          top: 7.76, left: 24.5
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF2B436D),
                          image: DecorationImage(
                            image: NetworkImage(''), //Aca va la imagen
                          )
                        ),
                      ),
                      SizedBox(
                        child: Container( //Lista
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 30.75, left: 24, right: 24
                                        ),
                                        child: Text ('Servicio N', //Nombre del servicio
                                          style:TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 22,
                                              fontWeight: FontWeight. bold,
                                              color: Color(0xFF2B436D)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 24, left: 24, right: 24
                                        ),
                                        child: Text ('Su labor', //Labor del servicio
                                          style:TextStyle(
                                              fontFamily: 'Mulish',
                                              fontSize: 16,
                                              fontWeight: FontWeight. bold,
                                              color: Color(0xFF2B436D)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 4, left: 24, right: 24
                                        ),
                                        child: Text ('La labor es.............................................................................................................................................................', //Labor del servicio
                                          style:TextStyle(
                                              fontFamily: 'Mulish',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF2B436D)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 24, left: 24, right: 24
                                        ),
                                        child: Text ('Fotos', //Labor del servicio
                                          style:TextStyle(
                                              fontFamily: 'Mulish',
                                              fontSize: 16,
                                              fontWeight: FontWeight. bold,
                                              color: Color(0xFF2B436D)),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 24
                                        ),
                                        child: SizedBox( //lista de los tipos de servicios
                                          height: 168,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: users!.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              return Align(
                                                child: Container(
                                                  width: 120,
                                                  height: 120,
                                                  child: Container(
                                                    child: Card(
                                                      semanticContainer: true,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                                        child: Image.network( // Imagen del servicio
                                                          users[index].avatar!,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ),
                                              );
                                            }
                                          )
                                        ),
                                      ),
                                    ]
                                  ),
                                );
                              }
                          ),
                        ),
                      )
                    ]
                  ),
                ),
              );
            }
          )
      )
    );
  }
}