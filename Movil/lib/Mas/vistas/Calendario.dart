import 'package:flutter/material.dart';
import 'package:opciontec/Mas/modelos/eventos.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../locators.dart';
import '../controladores/datos_eventos.dart';

/// The hove page which hosts the calendar
class CalendarApp extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  //const CalendarApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalendarAppState createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  void initState() {
    super.initState();

    locator<DatosEventos>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    List<DataEventos>? eventos = Provider.of<DatosEventos>(context).eventos;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_circle_left_rounded,
              size: 40.0, color: Colors.lightBlueAccent),
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
              SizedBox(
                width: width - 50,
                height: (3 * height) / 5,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        //height: width / 2,
                        //width: width - 50,
                        bottom: 0,
                        child: Scaffold(
                            body: SfCalendar(
                          //locale: 'pl_PL',
                          view: CalendarView.month,
                          showNavigationArrow: true,
                          dataSource: Eventos(eventos),

                          // by default the month appointment display mode set as Indicator, we can
                          // change the display mode as appointment using the appointment display
                          // mode property
                          monthViewSettings: const MonthViewSettings(
                              appointmentDisplayMode:
                                  MonthAppointmentDisplayMode.appointment),
                        ))),
                  ],
                  //Stack
                ), //Center
              ),
              Text(" "),
              SizedBox(
                width: width - 50,
                height: 3 * height / 5,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      top: 55,
                      right: 0,
                      //height: width / 2,
                      //width: width - 50,
                      bottom: 0,
                      child: Scaffold(
                        body: SfCalendar(
                            view: CalendarView.schedule,
                            dataSource: Eventos(eventos),
                            scheduleViewSettings: ScheduleViewSettings(
                                appointmentItemHeight: 70,
                                hideEmptyScheduleWeek: true),
                            showDatePickerButton: true),
                      ),
                    ),
                  ],
                  //Stack
                ), //Center
              ),
            ],
            //Stack
          ), //Center
        ),
      ),
    );
  }
}
