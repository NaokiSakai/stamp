import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'ResultPage.dart';

class FirstPage extends StatefulWidget {
  final String title;
  final List<DateTime> selectedDays;

  FirstPage({required this.title, required this.selectedDays});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  List<DateTime> _selectedDays = [];

  @override
  void initState() {
    _selectedDays = List.from(widget.selectedDays);
    super.initState();
  }

  void registerSelectedDays() {
    print('Selected Days: $_selectedDays');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(title: widget.title, selectedDays: _selectedDays),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Expanded(
            child: TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.now().subtract(Duration(days: 365)),
              lastDay: DateTime.now().add(Duration(days: 365)),
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return _selectedDays.any((selectedDay) => isSameDay(selectedDay, day));
              },
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, date, _) {
                  // Add color and photo (stamp) when selected
                  return Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.green, // Change color to desired color
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            '${date.day}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Image.asset(
                            '../asset/egaonotaiyou_ki.png', // Replace with the path to your image (stamp)
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                todayBuilder: (context, date, _) {
                  return Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  if (_selectedDays.contains(selectedDay)) {
                    _selectedDays.remove(selectedDay);
                  } else {
                    _selectedDays.add(selectedDay);
                  }
                  _focusedDay = focusedDay;
                });
              },
            ),
          ),
          Container(
            color: Color.fromARGB(255, 191, 227, 250),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: registerSelectedDays,
                  child: Text('登録'),
                ),
                SizedBox(width: 16),
                Text(
                  'Selected Days: ${_selectedDays.length}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
