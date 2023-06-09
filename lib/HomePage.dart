import 'package:flutter/material.dart';
import 'FirstPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("スタンプカレンダー"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150, // テキストフィールドの幅を指定
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'カレンダータイトル',
                ),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              child: Text("作成する"),
              onPressed: () {
                String title = _titleController.text;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstPage(title: title),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
