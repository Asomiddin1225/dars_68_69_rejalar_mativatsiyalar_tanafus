// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../services/locol_notif.dart';

// class QuotesScreen extends StatefulWidget {
//   const QuotesScreen({super.key});

//   @override
//   State<QuotesScreen> createState() => _QuotesScreenState();
// }

// class _QuotesScreenState extends State<QuotesScreen> {
//   List<String> quotes = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchQuotes();
//   }

//   Future<void> fetchQuotes() async {
//     final response = await http.get(Uri.parse('https://type.fit/api/quotes'));
//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       setState(() {
//         quotes = data.map((quote) => quote['text'] as String).toList();
//       });
//     } else {
//       throw Exception('Failed to load quotes');
//     }
//   }

//   void scheduleDailyNotification() {
//     // Schedule notification using LocaNotService
//     LocaNotService.scheduleDailyMotivation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Kunlik Mativatsiyalar')),
//       body: ListView.builder(
//         itemCount: quotes.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(quotes[index]),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: scheduleDailyNotification,
//         child: const Icon(Icons.notifications),
//       ),
//     );
//   }
// }




import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/locol_notif.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  List<String> quotes = [];

  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

  Future<void> fetchQuotes() async {
    final response = await http.get(Uri.parse('https://type.fit/api/quotes'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        quotes = data.map((quote) => quote['text'] as String).toList();
      });
    } else {
      throw Exception('Failed to load quotes');
    }
  }

  void scheduleDailyNotification(TimeOfDay time) {
    final now = DateTime.now();
    final selectedTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final formattedTime = "${selectedTime.hour}:${selectedTime.minute}";
    
    // Schedule notification using LocaNotService
    LocaNotService.scheduleTaskReminder("Kunlik Mativat", formattedTime as DateTime);
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      scheduleDailyNotification(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kunlik Mativatsiyalar')),
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(quotes[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => selectTime(context),
        child: const Icon(Icons.notifications),
      ),
    );
  }
}
