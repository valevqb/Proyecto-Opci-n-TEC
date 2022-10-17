import 'package:flutter/material.dart';
import 'package:opciontec/Mas/modelos/eventos.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The hove page which hosts the calendar
class CalendarApp extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  //const CalendarApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalendarAppState createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  @override
  Widget build(BuildContext context) {
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
                height: 3 * height / 5,
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
                          dataSource: Eventos(_getDataSource()),

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
                      top: 65,
                      right: 0,
                      //height: width / 2,
                      //width: width - 50,
                      bottom: 0,
                      child: Scaffold(
                        body: SfCalendar(
                            view: CalendarView.schedule,
                            dataSource: Eventos(_getDataSource()),
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
/*
/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}*/