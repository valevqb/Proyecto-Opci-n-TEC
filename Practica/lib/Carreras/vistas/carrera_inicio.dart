import 'package:flutter/material.dart';
import 'package:untitled/Carreras/modelos/usuario.dart';
import 'package:untitled/Carreras/servicios/datos_carrera.dart';
import 'package:provider/provider.dart';

import '../../locators.dart';

class InicioCarrera extends StatefulWidget {
  @override
  _InicioCarreraState createState() => _InicioCarreraState();
}

class _InicioCarreraState extends State<InicioCarrera> {

  @override
  void initState() {
    super.initState();
    locator<DatosCarrera>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    List<Data>? users = Provider.of<DatosCarrera>(context).users;
    bool isLoading = Provider.of<DatosCarrera>(context).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Text('Conocé las carreras'),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Image.network(users[index].avatar!),
                    title: Text(
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
                    trailing: Text('ID: ' + users[index].id.toString()),
                  ),
                );
              }),
    );
  }
}
