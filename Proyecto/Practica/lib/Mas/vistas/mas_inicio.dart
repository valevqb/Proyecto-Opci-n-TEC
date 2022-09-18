import 'package:flutter/material.dart';
import 'package:untitled/Mas/modelos/Costos.dart';
import 'package:untitled/Mas/modelos/Becas.dart';
import 'package:untitled/Mas/modelos/Preguntas.dart';
import 'package:untitled/Mas/controladores/datos_costos.dart';
import 'package:untitled/Mas/controladores/datos_becass.dart';
import 'package:untitled/Mas/controladores/datos_preguntas.dart';
import 'package:provider/provider.dart';

import '../../locators.dart';

class InicioMas extends StatefulWidget {
  @override
  _InicioMasState createState() => _InicioMasState();
}

class _InicioMasState extends State<InicioMas> {

  @override
  void initState() {
    super.initState();
    locator<DatosCostos>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    List<DatosCostos>? users = Provider.of<DatosCostos>(context).costos;
    bool isLoading = Provider.of<DatosCostos>(context).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Text('Más Información'),
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
                leading: Image.network(users[index].IMG!),
                title: Text(
                  users[index].Nombre! + " " + users[index].Descripcion!,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                subtitle: Text(
                  users[index].Horario!,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                trailing: Text('ID: ' + users[index].id.toString()),
              ),
            );
          }),
    );
  }
}