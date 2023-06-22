import 'dart:async';
import 'package:hangman_and_texttwist/constants/constants.dart';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Duration _duration = Duration.zero;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    return "${twoDigits(minutes)}:${twoDigits(seconds)}";
  }

  @override
  Widget build(BuildContext context) {
    String timerText = formatTime(_duration);
    if (_timer == null) {
      startTimer();
    }
    return Text(
      timerText,
      style: const TextStyle(
        fontFamily: Constants.fontFamily,
        fontSize: 30,
      ),
    );
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _duration += const Duration(seconds: 1);
      });
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    _duration = Duration.zero;
  }
}
