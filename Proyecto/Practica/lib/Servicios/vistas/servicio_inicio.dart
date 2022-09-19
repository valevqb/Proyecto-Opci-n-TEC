import 'package:flutter/material.dart';
import 'package:untitled/Servicios/modelos/servicio.dart';
import 'package:untitled/Servicios/servicios/datos_servicio.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Servicios/vistas/servicio_informacion.dart';

import '../../locators.dart';

class InicioServicio extends StatefulWidget {
  @override
  _InicioServicioState createState() => _InicioServicioState();
}

class _InicioServicioState extends State<InicioServicio> {

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
                      tituloImagenPrincipal(context),
                      SizedBox( //La parte en donde se muestran los servicios
                        child: Container( //Lista
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          ),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: users!.length,
                              itemBuilder: (BuildContext context, int index){
                                return Align(
                                  alignment: Alignment.topLeft,
                                    child: Container(
                                      height: 208,
                                      margin: EdgeInsets.only(left: 21.4, top: 32),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          tipoServicio(context, users[index]),
                                          SizedBox( //lista de los tipos de servicios
                                            height: 168,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: users.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                    width: 151,
                                                    height: 168,
                                                    child: cartas(context, users[index]),
                                                  ),
                                                );
                                              }
                                            )
                                          )
                                        ],
                                      )
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

  Widget tituloImagenPrincipal (BuildContext context) { //titulo de la pagina e imagen
    return Container( //La imagen donde dice servicios
      height: 286,
      width: (MediaQuery
          .of(context)
          .size
          .width),
      padding: EdgeInsets.only(
          top: 7.76, left: 24.5
      ),
      decoration: BoxDecoration(
          color: Color(0xFF2B436D),
          image: DecorationImage(
            image: NetworkImage(''), //Aca va la imagen
          )
      ),
      child: Text('Servicios', style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget tipoServicio (BuildContext context, tipoServicio) { //tipos de servicio
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Text( //Titutlo de cada tipo de servicio
          tipoServicio.firstName!,
          style: Theme.of(context).textTheme.titleMedium
      ),
    );
  }

  Widget cartas (BuildContext context, servicio) { //cartas de cada tipo de servicio
    return Card(
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: new InkWell(
        onTap: () {
          if(servicio.firstName != "Eve"){ //validacion de si son buses o no
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InformacionServicio()),
            );
          }
          else{
            ;
          }
          //print("tapped " +  users[index].firstName!);
        },
        child: Container(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network( // Imagen del servicio
                      servicio.avatar!,
                      fit: BoxFit.fill,
                      width: 143,
                      height: 90,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 8.0, left: 16),
                      child: CircleAvatar ( //avatar representativo del servicio
                        radius: 16,
                        backgroundImage: NetworkImage(
                          servicio.avatar!,
                        ),
                      )
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8.0, left: 16),
                    child: Text ( //nombre del servicio
                      servicio.firstName!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}