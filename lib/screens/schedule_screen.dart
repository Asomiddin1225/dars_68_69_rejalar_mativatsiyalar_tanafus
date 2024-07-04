// import 'package:flutter/material.dart';
// import '../services/locol_notif.dart';

// class ScheduleScreen extends StatefulWidget {
//   const ScheduleScreen({super.key});

//   @override
//   State<ScheduleScreen> createState() => _ScheduleScreenState();
// }

// class _ScheduleScreenState extends State<ScheduleScreen> {
//   final TextEditingController _taskController = TextEditingController();
//   final TextEditingController _timeController = TextEditingController();

//   void scheduleTaskReminder() {
//     // Schedule task reminder using LocaNotService
//     final task = _taskController.text;
//     final time = _timeController.text;
//     LocaNotService.scheduleTaskReminder(task, time);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Rejalar')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _taskController,
//               decoration: const InputDecoration(labelText: 'Reja kiriting'),
//             ),
//             TextField(
//               controller: _timeController,
//               decoration: const InputDecoration(labelText: 'Vaqt kiriting (Soat:mint)'),
//             ),
//             const SizedBox(height: 20),
//             FilledButton(
//               onPressed: scheduleTaskReminder,
//               child: const Text('Rejani saqlash'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../services/locol_notif.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = picked.format(context);
      });
    }
  }

  void scheduleTaskReminder() {
    final task = _taskController.text;
    if (_selectedTime != null && task.isNotEmpty) {
      final now = DateTime.now();
      final scheduledDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      ).subtract(const Duration(minutes: 1));

      LocaNotService.scheduleTaskReminder(task, scheduledDateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rejalar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(labelText: 'Reja kiriting'),
            ),
            TextField(
              controller: _timeController,
              readOnly: true,
              onTap: () => _selectTime(context),
              decoration: const InputDecoration(labelText: 'Vaqt tanlang (Soat:Minut)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: scheduleTaskReminder,
              child: const Text('Rejani saqlash'),
            ),
          ],
        ),
      ),
    );
  }
}
