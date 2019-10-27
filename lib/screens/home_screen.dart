import 'package:flutter/material.dart';
import 'package:time_sheet_mobile/models/time_sheet.dart';

class HomePage extends StatefulWidget {
  final TextStyle optionStyle;

  HomePage({this.optionStyle});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TimeOfDay> times = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: times.map((f) {
            return ListTile(
              title: Text('a'),
              subtitle: Text(f.toString()),
              leading: Icon(Icons.access_time),
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((selectedTime) {
              debugPrint(selectedTime.toString());
              setState(() {
                if (selectedTime != null) {
                  times.add(selectedTime);
                }
              });
            });
          },
          tooltip: 'New shift',
          child: Icon(Icons.add),
        ));
  }
}
