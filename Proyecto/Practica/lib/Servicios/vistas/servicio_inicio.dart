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
                      Container(
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
                        child: Text ('Servicios',
                          style:TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight. bold,
                            color: Colors.white),
                        ),
                      ),
                      SizedBox(
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
                                          Container(
                                            margin: const EdgeInsets.only(bottom: 16.0),
                                            child: Text(
                                            users[index].firstName!,
                                            style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight. bold,
                                            color: Color(0xFFB2B436D))
                                            ),
                                          ),
                                          SizedBox(
                                            height: 168,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: users!.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                    width: 151,
                                                    height: 168,
                                                    child: Card(
                                                      semanticContainer: true,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(24),
                                                      ),
                                                      child: new InkWell(
                                                        onTap: () {
                                                          print("tapped " +  users[index].firstName!);
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
                                                                    child: Image.network( // Imagen principal
                                                                      users[index].avatar!,
                                                                      fit: BoxFit.fill,
                                                                      width: 143,
                                                                      height: 90,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                      margin: const EdgeInsets.only(top: 8.0, left: 16),
                                                                      child: CircleAvatar (
                                                                        radius: 16,
                                                                        backgroundImage: NetworkImage(
                                                                          users[index].avatar!,
                                                                        ),
                                                                      )
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets.only(top: 8.0, left: 16),
                                                                    child: Text (
                                                                      users[index].firstName!,
                                                                      style: TextStyle(fontFamily: 'Mulish',
                                                                          fontSize: 14, fontWeight: FontWeight. bold),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
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
            /*child: ListView.builder(
            itemCount: users!.length,
            itemBuilder: (BuildContext context, int index) {
              return Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 208,
                  margin: EdgeInsets.only(left: 21.4, top: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ ///////////
                      Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          users[index].firstName!,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight. bold,
                              color: Color(0xFFB2B436D))
                        )
                      ),
                      SizedBox(
                          height: 168,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: users!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Align( /////////
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                      width: 151,
                                      height: 168,
                                      child: Card(
                                          semanticContainer: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24),
                                          ),
                                        child: new InkWell(
                                            onTap: () {
                                              print("tapped " +  users[index].firstName!);
                                            },
                                          child: Container( //////
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
                                                      child: Image.network( // Imagen principal
                                                        users[index].avatar!,
                                                        fit: BoxFit.fill,
                                                        width: 143,
                                                        height: 90,
                                                      ),
                                                    ), ----------------------------------------------
                                                    Container(
                                                        margin: const EdgeInsets.only(top: 8.0, left: 16),
                                                        child: CircleAvatar (
                                                          radius: 16,
                                                          backgroundImage: NetworkImage(
                                                            users[index].avatar!,
                                                          ),
                                                        )
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets.only(top: 8.0, left: 16),
                                                      child: Text (
                                                        users[index].firstName!,
                                                        style: TextStyle(fontFamily: 'Mulish',
                                                            fontSize: 14, fontWeight: FontWeight. bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                      ),
                    ],
                  ),
                ),
              );
            })*/
      )
    );
  }
}