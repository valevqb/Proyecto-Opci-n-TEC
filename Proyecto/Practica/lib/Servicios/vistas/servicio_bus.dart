import 'package:flutter/material.dart';
import 'package:untitled/Servicios/modelos/servicio.dart';
import 'package:untitled/Servicios/servicios/datos_bus.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Servicios/modelos/servicioBus.dart';

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
  late int _index;

  @override
  void initState() {
    super.initState();
    _valor = this.widget.servicioSeleccionado;
    _destino = "Destino";
    _origen = "Origen";
    _index = 0;
    locator<DatosBus>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = Provider.of<DatosBus>(context).isLoading;
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
                              child: Container(//Lista
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
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 44.00),
            child: Text("Buses",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,),
          ),
          //nombreDestino(context),
        ],
      )
    );
  }

  Widget nombreDestino (BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(
          top: 34.7, bottom: 59.5, left: 24, right: 24),
      child: Align (
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
                left: 13, right: 74
            ),
            child: Column(
              children: [
                Container(
                  height: 56,
                  child: dropInformacionOrigen (context, ["Origen","1","2","3"]),
                ),
                Container(
                  height: 56,
                  child: dropInformacionDestino (context, ["Destino","1","2","3"]),
                )
              ],
            ),
          )
        ],
        ),
      ),
    );
  }

  Widget dropInformacionOrigen (BuildContext context, List informacion){ //Informacion de cada dropdown
    return DropdownButton(
      isExpanded: true,
      value: _origen,
      items: informacion.map((dynamic lists)
      => DropdownMenuItem(
        value: lists.toString(),
        child: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            lists.toString(),
            style: Theme.of(context).textTheme.bodyLarge),
        )
      ),
      ).toList(),
      onChanged: (String? newValue){
        setState(() {
          _origen = newValue.toString();
        });
      },
    );
  }

  Widget dropInformacionDestino (BuildContext context, List informacion){ //Informacion de cada dropdown
    return DropdownButton(
      isExpanded: true,
      value: _destino,
      items: informacion.map((dynamic lists)
      => DropdownMenuItem(
          value: lists.toString(),
          child: Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
                lists.toString(),
                style: Theme.of(context).textTheme.bodyLarge),
          )
      ),
      ).toList(),
      onChanged: (String? newValue){
        setState(() {
          _destino = newValue.toString();
        });
      },
    );
  }

  Widget informacionServicio (BuildContext context, servicioSeleccion){ //list users son las imagenes, carga la info de los servicios
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 23.39, left: 24, right: 24
            ),
            child: Text (
              "Aquí podés encontrar todas las rutas de buses para movilizarte al TEC de Cartago. ", //Labor del servicio
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(
                      top: 20.60, left: 24
                  ),
                  alignment: Alignment.topLeft,
                  child: dataBusServicio(context, "Precio", 0, 'lib/Fotos/Precio.jpg')
              ),
              Container(
                  padding: EdgeInsets.only(
                      top: 20.60, left: 24
                  ),
                  alignment: Alignment.topLeft,
                  child: dataBusServicio(context, "Salida", "Blablabla", 'lib/Fotos/Salida.jpg')
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.only(
                  top: 20.60, left: 24
              ),
              alignment: Alignment.topLeft,
              child: dataBusServicio(context, "Paradas", "Blablabla", 'lib/Fotos/Paradas.jpg')
          ),
          Container(
              padding: EdgeInsets.only(
                  top: 20.60, left: 24
              ),
              alignment: Alignment.topLeft,
              child: dataBusServicio(context, "Horarios", "Blablabla", 'lib/Fotos/Horarios.jpg')
          ),
        ]
    );
  }

  Widget dataBusServicio (BuildContext context, titulo, cantidad, imagen){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            width: 24,
            height: 24,
            image: AssetImage(imagen)
        ),
        Container(
          margin: const EdgeInsets.only(left: 5.5),
          child: Column(
            children: [
              Text (
                titulo.toString(), //Labor del servicio
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text (
                cantidad.toString(), //Labor del servicio
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}