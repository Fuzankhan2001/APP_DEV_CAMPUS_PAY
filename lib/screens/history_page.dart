import 'package:flutter/material.dart';

class QuizHistoryPage extends StatelessWidget {
  const QuizHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy quiz history data
    final List<Map<String, dynamic>> history = [
      {'date': '2025-08-07', 'score': 85},
      {'date': '2025-08-06', 'score': 78},
      {'date': '2025-08-05', 'score': 92},
      {'date': '2025-08-04', 'score': 80},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz History'),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black,
      body: ListView.separated(
        itemCount: history.length,
        separatorBuilder: (context, index) =>
            const Divider(color: Colors.white30),
        itemBuilder: (context, index) {
          final entry = history[index];
          return ListTile(
            leading: const Icon(Icons.history, color: Colors.amber),
            title: Text(
              'Date: ${entry['date']}',
              style: const TextStyle(color: Colors.white),
            ),
            trailing: Text(
              'Score: ${entry['score']}',
              style: const TextStyle(
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
