import 'package:flutter/material.dart';

void main() {
  runApp(SimpleLogicApp());
}

class SimpleLogicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Logic App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleLogicPage(),
    );
  }
}

class SimpleLogicPage extends StatefulWidget {
  @override
  _SimpleLogicPageState createState() => _SimpleLogicPageState();
}

class _SimpleLogicPageState extends State<SimpleLogicPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Logic: determine which message to show based on the counter value.
  String getMessage() {
    if (_counter != 0 && _counter % 5 == 0) {
      return 'Divisible by 5!';
    } else if (_counter % 2 == 0) {
      return 'Even number!';
    } else {
      return 'Odd number!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Logic App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter: $_counter',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text(
              getMessage(),
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
