import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(CalendarApp());

class CalendarApp extends StatefulWidget {
  @override
  _CalendarAppState createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  CalendarView _calendarView = CalendarView.month;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calendar'),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  child: Text('Month'),
                  onPressed: () {
                    setState(() {
                      _calendarView = CalendarView.month;
                    });
                  },
                ),
                TextButton(
                  child: Text('Week'),
                  onPressed: () {
                    setState(() {
                      _calendarView = CalendarView.week;
                    });
                  },
                ),
                TextButton(
                  child: Text('Day'),
                  onPressed: () {
                    setState(() {
                      _calendarView = CalendarView.day;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: SfCalendar(
                key: ValueKey(_calendarView),
                view: _calendarView,
                dataSource: _getCalendarDataSource(),
                onTap: (CalendarTapDetails details) {
                  print(details.date);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _DataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'Meeting',
      color: Colors.blue,
    ));
    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
