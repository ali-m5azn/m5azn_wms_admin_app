import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  late DateTime _endTime;

  @override
  void initState() {
    super.initState();
    // Set the duration of your timer (e.g., 2 days)
    Duration duration = const Duration(days: 2);
    _endTime = DateTime.now().add(duration);

    // Start the timer to update the UI every 100 milliseconds
    _timer = Timer.periodic(const Duration(milliseconds: 100), _updateTimer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTimer(Timer timer) {
    setState(() {});
  }

  String _formatDuration(Duration duration) {
    int days = duration.inDays;
    int hours = duration.inHours.remainder(24);
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    // Calculate the remaining months
    int months = (days / 30).floor();
    days = days % 30;

    return '$months\t\t $days\t\t $hours\t\t $minutes\t\t $seconds';
  }

  @override
  Widget build(BuildContext context) {
    Duration remainingTime = _endTime.difference(DateTime.now());
    String formattedTime = _formatDuration(remainingTime);

    return Center(
      child: Text(
        formattedTime,
        style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }
}
