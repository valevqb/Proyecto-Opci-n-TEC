import 'package:flutter/material.dart';
import 'package:opciontec/Servicios/modelos/servicio.dart';
import 'package:opciontec/Servicios/servicios/datos_servicio.dart';
import 'package:provider/provider.dart';
import 'package:opciontec/Servicios/vistas/servicio_inicio.dart';
import 'package:opciontec/Servicios/modelos/servicio.dart';

import '../../locators.dart';

class InformacionServicio extends StatefulWidget {
  final DataServicio servicioSeleccionado;
  InformacionServicio(this.servicioSeleccionado);

  @override
  _InformacionServicioState createState() => _InformacionServicioState();
}

class _InformacionServicioState extends State<InformacionServicio> {
  late DataServicio _valor;

  @override
  void initState() {
    super.initState();
    _valor = this.widget.servicioSeleccionado;
    locator<DatosServicio>().fetchServicios();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = Provider.of<DatosServicio>(context).isLoading;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_circle_left_rounded,
                size: 40.0, color: Color(0xFFCBEFF7)),
          ),
          elevation: 0,
          backgroundColor: const Color(0xFF1C2D4B),
        ),
        body: (isLoading)
          ? Container(

        )
          : ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tituloImagenPrincipal(context, _valor),
                  SizedBox(
                    child: Container( //Lista
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
                              child: informacionServicio(context, _valor),
                            );
                          }
                      ),
                    ),
                  )
                ]
              ),
            );
          }
          )
    );
  }

  Widget tituloImagenPrincipal (BuildContext context, servicioSeleccion) { //titulo de la pagina e imagen
    return Container( //La imagen donde dice servicios
      height: 286,
      width: (MediaQuery.of(context).size.width),
      decoration: const BoxDecoration(
          color: Color(0xFF2B436D),
      ),
      child: Image.network( // Imagen del servicio
        servicioSeleccion?.Fotos[0]!,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget informacionServicio (BuildContext context, servicioSeleccion){ //list users son las imagenes, carga la info de los servicios
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 30.75, left: 24, right: 24
            ),
            child: Text (servicioSeleccion.Nombre, //Nombre del servicio
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight. bold,
                  color: Color(0xFFB2B436D)),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 24, left: 24, right: 24
            ),
            child: const Text ('Su labor', //Labor del servicio
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  fontWeight: FontWeight. bold,
                  color: Color(0xFF2B436D)),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 4, left: 24, right: 24
            ),
            child: Text (servicioSeleccion.Descripcion, //Labor del servicio
              style: const TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 14,
                  fontWeight: FontWeight. bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 24, left: 24, right: 24
            ),
            child: const Text ('Fotos', //Labor del servicio
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  fontWeight: FontWeight. bold,
                  color: Color(0xFF2B436D)),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 24
            ),
            child: SizedBox( //lista de los tipos de servicios
                height: 168,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: servicioSeleccion?.Fotos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Align(
                        child: SizedBox(
                            width: 120,
                            height: 120,
                            child: Card(
                              semanticContainer: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(const Radius.circular(8)),
                                child: Image.network( // Imagen del servicio
                                  servicioSeleccion?.Fotos[index]!,
                                  fit: BoxFit.fill,
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
    );
  }
}