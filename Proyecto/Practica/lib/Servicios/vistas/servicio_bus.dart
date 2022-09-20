/*import 'package:flutter/material.dart';
import 'package:untitled/Servicios/modelos/servicio.dart';
import 'package:untitled/Servicios/servicios/datos_servicio.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Servicios/vistas/servicio_inicio.dart';

import '../../locators.dart';

class InformacionBus extends StatefulWidget {
  @override
  _InformacionBusState createState() => _InformacionBusState();
}

class _InformacionBusState extends State<InformacionBus> {
  dynamic optionesSede = "George";

  @override
  void initState() {
    super.initState();
    locator<DatosServicio>().fetchServicios();
  }

  @override
  Widget build(BuildContext context) {
    List<DataServicio>? users = Provider.of<DatosServicio>(context).servicios;
    bool isLoading = Provider.of<DatosServicio>(context).isLoading;
    print(users?.first.firstName);

    return Scaffold(
      body: (isLoading)
          ? Container(

        )
          : Container(
        child: DropdownButton(
          value: optionesSede,
          icon: Icon(Icons.arrow_downward),
          items: users
              ?.map((value) => DropdownMenuItem(
            value: value.firstName.toString(),
            child: Text(value.firstName.toString()),
          )).toList(),
          onChanged: (newmenu){
            setState(() {
              print(optionesSede);
              optionesSede = newmenu!;
              //print(optionesSede);
            });
          },
        ),
            /*child: ListView.builder(
            itemCount: users!.length,
            itemBuilder: (BuildContext context, int index) {
              return Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      tituloImagenPrincipal(context),
                      Container( //Lista
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          ),
                          //child: DropdownButton <String>(items: [1,2],),
                          /*ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: informacionServicio(context, users!),
                                );
                              }
                          ),*/
                        ),
                      //)
                    ]
                  ),
                ),
              );
            }
          )*/
      )
    );
  }

  Widget tituloImagenPrincipal (BuildContext context) { //titulo de la pagina e imagen
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
    );
  }

  Widget informacionServicio (BuildContext context, List users){ //list users son las imagenes, carga la info de los servicios
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 30.75, left: 24, right: 24
            ),
            child: Text ('Servicio N', //Nombre del servicio
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
            child: Text ('La labor es.............................................................................................................................................................', //Labor del servicio
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
    );
  }
}*/