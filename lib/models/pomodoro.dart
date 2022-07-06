
import 'package:flutter/widgets.dart';

class Pomodoro {
  int rounds = 0;
  int countdown = 0;
  int worktime;
  int shortBreakTime;
  int currentShortBreakTime = 0;
  String state = 'work';

  Pomodoro({
    required this.worktime,
    required this.shortBreakTime,
  });
  
  init() {
    countdown = worktime;
  }

  goToNextRound() {
    debugPrint('next round');
    countdown = shortBreakTime;
    state = 'pause';
  }

  goToEndofPause() {
    debugPrint('end of pause');
    countdown = worktime;
    state = 'work';
  }

}