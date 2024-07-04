import 'package:flutter/material.dart';
import 'quotes_screen.dart';
import 'schedule_screen.dart';
import 'pomodoro_screen.dart';
import '../services/locol_notif.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () {
                  LocaNotService.showNotification();
                },
                child: const Text("Darxol xabarnoma yuborish")),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuotesScreen()));
                },
                child: const Text("Kunlik mativatsiyalar")),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScheduleScreen()));
                },
                child: const Text("Rejalar")),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PomodoroScreen()));
                },
                child: const Text("Pamidor")),
          ],
        ),
      ),
    );
  }
}
