// import 'dart:async';

// class MyTimer {
//   int timer;
//   bool started = false;

//   MyTimer({
//     required this.timer
//   });

//   start() {
//     Timer.periodic(new Duration(seconds: 1), (_timer) {
//       started = true;
//       timer -= 1;
//       if (!started) {
//         _timer.cancel();
//       }
//     });
//   }

//   stop() {
//     started = false;
//   }

//   cancelTimer(_timer) {
//     _timer.cancel;
//   }

// }