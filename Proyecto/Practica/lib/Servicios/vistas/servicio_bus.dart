import 'package:flutter/material.dart';
import 'package:untitled/Servicios/modelos/servicio.dart';
import 'package:untitled/Servicios/servicios/datos_servicio.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Servicios/vistas/servicio_inicio.dart';
import 'package:untitled/Servicios/modelos/servicio.dart';

import '../../locators.dart';

class InformacionBus extends StatefulWidget {
  final DataServicio servicioSeleccionado;
  InformacionBus(this.servicioSeleccionado);

  @override
  _InformacionBusState createState() => _InformacionBusState();
}

class _InformacionBusState extends State<InformacionBus> {
  late DataServicio _valor;
  late String _destino;
  late String _origen;

  @override
  void initState() {
    super.initState();
    _valor = this.widget.servicioSeleccionado;
    _destino = "Destino";
    _origen = "Origen";
    locator<DatosServicio>().fetchServicios();
  }

  @override
  Widget build(BuildContext context) {
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
                            seleccionOrigen(context),
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
                                        child: informacionServicio(context, _valor),
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

  Widget seleccionOrigen (BuildContext context) { //titulo de la pagina e imagen
    return Container( //La imagen donde dice servicios
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
      child: nombreDestino(context),
    );
  }

  Widget nombreDestino (BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(
          top: 45.7, bottom: 70.3, left: 24, right: 24),
      child: Column(
      children: [
        DropdownButton(
          isExpanded: true,
          value: _origen,
          items: ["Origen","1","2","3"].map((String lists)
          => DropdownMenuItem(
            value: lists,
            child: Text(
              lists,
              style: Theme.of(context).textTheme.bodyLarge),
          ),
          ).toList(),
          onChanged: (String? newValue){
            setState(() {
              _origen = newValue.toString();
            });
          },
        )
      ],
    ),
    );
  }

  Widget informacionServicio (BuildContext context, servicioSeleccion){ //list users son las imagenes, carga la info de los servicios
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 30.75, left: 24, right: 24
            ),
            child: Text (servicioSeleccion.Nombre, //Nombre del servicio
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: 24, left: 24, right: 24
            ),
            child: Text ('Su labor', //Labor del servicio
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: 4, left: 24, right: 24
            ),
            child: Text (servicioSeleccion.Descripcion, //Labor del servicio
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: 24, left: 24, right: 24
            ),
            child: Text ('Fotos', //Labor del servicio
              style: Theme.of(context).textTheme.bodyLarge,
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
                    itemCount: servicioSeleccion?.Fotos.length,
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
                                    servicioSeleccion?.Fotos[index]!,
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
    );
  }
}