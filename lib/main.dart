import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

void main() {
  runApp(StampsApp());
}

class StampsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ラジオ体操スタンプカード',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StampsScreen(),
    );
  }
}

class StampsScreen extends StatefulWidget {
  @override
  _StampsScreenState createState() => _StampsScreenState();
}

class _StampsScreenState extends State<StampsScreen> {
  int stampsCount = 0;
  bool isCompleted = false;

  void incrementStampsCount() {
    if (!isCompleted) {
      setState(() {
        stampsCount++;
        if (stampsCount >= 10) {
          isCompleted = true;
        }
      });
    }
  }

  void resetStampsCount() {
    setState(() {
      stampsCount = 0;
      isCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ラジオ体操スタンプカード'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'スタンプの数: $stampsCount',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            isCompleted
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 80,
                  )
                : IconButton(
                    icon: Icon(
                      Icons.check_circle_outline,
                      color: Colors.grey,
                      size: 80,
                    ),
                    onPressed: incrementStampsCount,
                  ),
            SizedBox(height: 20),
            isCompleted
                ? ElevatedButton(
                    onPressed: resetStampsCount,
                    child: Text(
                      'リセット',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
