import 'package:flutter/material.dart';
import 'FirstPage.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final List<DateTime> selectedDays;

  ResultPage({required this.title, required this.selectedDays});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Days:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: selectedDays.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(selectedDays[index].toString()),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstPage(title: title, selectedDays: selectedDays),
                  ),
                );
              },
              child: Text('続ける'),
            ),
          ],
        ),
      ),
    );
  }
}
