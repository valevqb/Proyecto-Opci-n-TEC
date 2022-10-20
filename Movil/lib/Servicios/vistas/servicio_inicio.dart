import 'package:flutter/material.dart';
import 'package:opciontec/Servicios/modelos/servicio.dart';
import 'package:opciontec/Servicios/servicios/datos_servicio.dart';
import 'package:provider/provider.dart';
import 'package:opciontec/Servicios/vistas/servicio_informacion.dart';
import 'package:opciontec/Servicios/vistas/servicio_bus.dart';

import '../../Config.dart';
import '../../Sesion/vistas/Login.dart';
import '../../Sesion/vistas/Ver_Sesion.dart';
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
    List<List<DataServicio>>? servicio =
        Provider.of<DatosServicio>(context).servicios;
    bool isLoading = Provider.of<DatosServicio>(context).isLoading;
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Servicios',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              elevation: 0,
              backgroundColor: const Color(0xFF1C2D4B),
              actions: [
                IconButton(
                  onPressed: () {
                    if (Config.Sesion.contrasena.toString() == "null") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VerLaSesion()),
                      );
                    }
                  },
                  icon: const Icon(Icons.account_circle_sharp,
                      size: 40.0, color: Color(0xFFCBEFF7)),
                ),
              ],
            ),
            body: (isLoading)
                ? Container()
                : SingleChildScrollView(
                    child: Column(children: [
                      tituloImagenPrincipal(context),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: const EdgeInsets.only(left: 21.4),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 1,
                                itemBuilder: (BuildContext context, int index) {
                                  return Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            tipoServicio(
                                                context, "Facilidades"),
                                            listaServicios(
                                                context, servicio?[0]),
                                            tipoServicio(
                                                context, "Salud y Bienestar"),
                                            listaServicios(
                                                context, servicio?[1]),
                                            tipoServicio(
                                                context, "Para el Estudio"),
                                            listaServicios(
                                                context, servicio?[2]),
                                            tipoServicio(
                                                context, "Más servicios"),
                                            listaServicios(
                                                context, servicio?[3])
                                          ]));
                                })),
                      )
                    ]),
                  )));
  }

  Widget tituloImagenPrincipal(BuildContext context) {
    //titulo de la pagina e imagen
    return Container(
      //La imagen donde dice servicios
      height: 286,
      width: (MediaQuery.of(context).size.width),
      padding: const EdgeInsets.only(top: 7.76, left: 24.5),
      decoration: const BoxDecoration(
          color: Color(0xFF2B436D),
          image: DecorationImage(
            image: AssetImage('lib/Fotos/Servicios.png'), //Aca va la imagen
          )),
    );
  }

  Widget tipoServicio(BuildContext context, tipoServicio) {
    //tipos de servicio
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0, top: 32.00),
      child: Text(
          //Titutlo de cada tipo de servicio
          tipoServicio,
          style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB2B436D))),
    );
  }

  Widget listaServicios(BuildContext context, servicio) {
    return SizedBox(
        height: 168,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: servicio?.length,
            itemBuilder: (BuildContext context, int index) {
              return Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 151,
                  height: 168,
                  child: cartas(context, servicio![index]),
                ),
              );
            }));
  }

  Widget cartas(BuildContext context, servicio) {
    //cartas de cada tipo de servicio
    return Card(
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: InkWell(
        onTap: () {
          if (servicio.Nombre.toString() != "Buses") {
            //validacion de si son buses o no
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InformacionServicio(servicio)),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InformacionBus()),
            );
          }
          //print("tapped " +  users[index].firstName!);
        },
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    // Imagen del servicio
                    servicio.Fotos![1].toString(),
                    fit: BoxFit.fill,
                    width: 143,
                    height: 90,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 8.0, left: 16),
                    child: CircleAvatar(
                      //avatar representativo del servicio
                      radius: 16,
                      backgroundImage: NetworkImage(
                        servicio.Icon.toString(), //HAY QUE PONERLE CERO
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 8.0, left: 16),
                  child: Text(
                    //nombre del servicio
                    servicio.Nombre!,
                    style: const TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
