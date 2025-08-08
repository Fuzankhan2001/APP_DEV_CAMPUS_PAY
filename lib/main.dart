import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';
import 'screens/quiz_page.dart';
import 'screens/leaderboard_page.dart';
import 'screens/history_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/quiz': (context) => const QuizPage(),
        '/leaderboard': (context) => const LeaderboardPage(),
        '/history': (context) => const QuizHistoryPage(),
      },
    );
  }
}
