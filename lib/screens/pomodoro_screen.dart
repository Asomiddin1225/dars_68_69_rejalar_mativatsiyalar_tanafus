import 'package:flutter/material.dart';
import '../services/locol_notif.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  bool isRunning = false;

  void startPomodoro() {
    setState(() {
      isRunning = true;
    });
    LocaNotService.startPomodoro();
  }

  void stopPomodoro() {
    setState(() {
      isRunning = false;
    });
    LocaNotService.stopPomodoro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pamidor')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: isRunning ? stopPomodoro : startPomodoro,
              child: Text(isRunning ? 'Stop' : 'Start'),
            ),
          ],
        ),
      ),
    );
  }
}
