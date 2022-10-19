import 'package:flutter/material.dart';
import 'package:opciontec/Calendario/modelos/eventos.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../locators.dart';
import '../controladores/datos_eventos.dart';
import 'Agregar_Evento.dart';
import 'ModificarEliminar_Evento.dart';
/*
void main() {
  return runApp(CalendarApp());
}*/

/// The app which hosts the home page which contains the calendar on it.
class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Calendario', home: MyHomePage());
  }
}

/// The hove page which hosts the calendar
class MyHomePage extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<DataEventos>? eventos = Provider.of<DatosEventos>(context).eventos;
    locator<DatosEventos>().fetchUsers();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_circle_left_rounded,
              size: 40.0, color: Color(0xBE5CC6DE)),
        ),
        title: const Text('Calendario',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C2D4B))),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: (width - 40) / 2,
                    height: 3 * height / 5,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            left: 0,
                            top: 0,
                            right: 0,
                            //height: width / 2,
                            //width: width / 2,
                            bottom: 0,
                            child: Scaffold(
                                body: SfCalendar(
                              //locale: 'pl_PL',
                              view: CalendarView.month,
                              cellBorderColor: Colors.transparent,
                              //showNavigationArrow: true,
                              dataSource: Eventos(eventos),
                              monthViewSettings: const MonthViewSettings(
                                  //showAgenda: true,
                                  appointmentDisplayMode:
                                      MonthAppointmentDisplayMode.appointment),
                            ))),
                      ],
                      //Stack
                    ), //Center
                  ),
                  Text(" "),
                  SizedBox(
                    width: (width - 40) / 2,
                    height: 3 * height / 5,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 0,
                          top: 65,
                          right: 0,
                          //height: width / 2,
                          //width: width - 50,
                          bottom: 0,
                          child: Scaffold(
                            body: SfCalendar(
                                view: CalendarView.schedule,
                                dataSource: Eventos(eventos),
                                onTap: (CalendarTapDetails details) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ModificarEliminarEvento(details),
                                  ));
                                },
                                scheduleViewSettings:
                                    const ScheduleViewSettings(
                                        appointmentItemHeight: 70,
                                        hideEmptyScheduleWeek: true),
                                showDatePickerButton: true),
                          ),
                        ),
                      ],
                      //Stack
                    ), //Center
                  ),
                  Text(" "),
                ],
              ),
              const Text(" "),
              SizedBox(
                height: 50,
                width: (width - 40) / 4,
                child: FloatingActionButton.extended(
                  label: const Text('Agregar Evento',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1C2D4B))),
                  // <-- Text
                  backgroundColor: Colors.lightBlue.shade100,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  icon: const Icon(
                      // <-- Icon
                      Icons.add_rounded,
                      size: 24.0,
                      color: Color(0xBE5CC6DE)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AgregarEvento(),
                    ));
                  },
                ),
              ),
              //List<Step> lista_pasos = [];
            ],
            //Stack
          ), //Center
        ),
      ),
    );
  }

  List<DataEventos> _getDataSource() {
    final List<DataEventos> meetings = <DataEventos>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(DataEventos(
        "Holis", startTime, endTime, const Color(0xFF0F8644), false));

    return meetings;
  }
}
