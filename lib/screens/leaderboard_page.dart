import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy leaderboard data
    final List<Map<String, dynamic>> leaderboard = [
      {'name': 'Aryan', 'score': 95},
      {'name': 'Simran', 'score': 90},
      {'name': 'Dev', 'score': 85},
      {'name': 'Ananya', 'score': 80},
      {'name': 'Zoya', 'score': 75},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black,
      body: ListView.separated(
        itemCount: leaderboard.length,
        separatorBuilder: (context, index) =>
            const Divider(color: Colors.white30),
        itemBuilder: (context, index) {
          final entry = leaderboard[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              entry['name'],
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            trailing: Text(
              'Score: ${entry['score']}',
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
          );
        },
      ),
    );
  }
}
