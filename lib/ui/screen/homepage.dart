import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/models/pomodoro.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Pomodoro _pomodoro = Pomodoro(worktime: 10, shortBreakTime: 5);
  String _texttimer = '0';
  String round = '0';
  late Timer timer;
  bool started = false;
  
  @override
  initState() {
    _pomodoro.init();
    super.initState();
    // Add listeners to this class
  }
  
  
  void startPomodoro() {
    started = true;
    timer = Timer.periodic(new Duration(seconds: 1), (_timer) {
      setState(() {
        _pomodoro.countdown -= 1;
        _texttimer = _pomodoro.countdown.toString();
        round = _pomodoro.rounds.toString();

        if(_pomodoro.countdown == 0) {
          if(_pomodoro.state == 'work') {
            _pomodoro.goToNextRound();
            stopTimer();
          }
          else if (_pomodoro.state == 'pause') {
            _pomodoro.goToEndofPause();
            stopTimer();
          }
        }

      });
    });
  }

  void stopTimer() {
    if(started) {
      timer.cancel();
    }
  }

  void displayCountDown() {
    _texttimer = _pomodoro.countdown.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'round : $round'
            ),
            Text(
              _texttimer,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: startPomodoro,
              child: Text('start pomodoro'),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: stopTimer,
              child: Text('stop timer'),
            )
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}