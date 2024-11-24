import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountdownTimer(),
      theme: ThemeData(
        brightness: Brightness.dark
      ),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int _timeLeft = 10;


  void _startCountdown() {
    Future.delayed(Duration(seconds: 1), _countdown);
  }


  void _countdown() {
    if (_timeLeft > 0) {
      setState(() {
        _timeLeft--;
      });
      Future.delayed(Duration(seconds: 1), _countdown);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Timer'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'time remaining: $_timeLeft',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startCountdown,
              child: Text('start timer'),
            ),
          ],
        ),
      ),
    );
  }
}
