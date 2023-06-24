import 'dart:async';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => TimerWidgetState();
}

class TimerWidgetState extends State<TimerWidget> {
  Duration duration = const Duration(seconds: 0);
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showTimerWidget();
  }

  void resetTimer() {
    setState(() {
      duration = const Duration(seconds: 0);
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void restartTimer() {
    resetTimer();
    startTimer();
  }

  void startTimer() {
    if (timer != null && timer!.isActive) {
      return;
    }
    void addSecond() {
      if(mounted) {
        setState(() {
          final seconds = duration.inSeconds + 1;
          duration = Duration(seconds: seconds);
        });
      }
    }

    timer = Timer.periodic(const Duration(seconds: 1), (_) => addSecond());
  }

  Widget showTimerWidget() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      "$minutes:$seconds",
      style: const TextStyle(
        fontFamily: Constants.fontFamily,
        fontSize: 30,
      ),
    );
  }
}
