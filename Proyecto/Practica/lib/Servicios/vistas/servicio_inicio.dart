import 'package:flutter/material.dart';
import 'package:untitled/Servicios/modelos/servicio.dart';
import 'package:untitled/Servicios/servicios/datos_servicio.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        title: Text('Conocé los servicios'),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: (isLoading)
          ? Align(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          //scrollDirection: Axis.horizontal,
          scrollDirection: Axis.horizontal,
          itemCount: users!.length,
          itemBuilder: (BuildContext context, int index) {
            return Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                  width: 151,
                  height: 168,
                  child: Card(
                      elevation: 5,
                      semanticContainer: true,
                      child: Container(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Image.network( //No quiere redimensionarse
                                      users[index].avatar!,
                                      fit: BoxFit.fill,
                                      width: 143,
                                      height: 90,
                                  ),
                                ),
                                Text("Hi"),
                              ],
                            ),
                          ],
                        ),
                      )

                  )
              ),
            );
          }),
    );
  }
}
     /*title: Text(
                  users[index].firstName! + " " + users[index].lastName!,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                subtitle: Text(
                  users[index].email!,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                trailing: Text('ID: ' + users[index].id.toString()),*/

