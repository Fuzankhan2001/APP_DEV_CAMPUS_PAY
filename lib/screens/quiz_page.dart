import 'package:flutter/material.dart';
import 'quiz_play.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Quiz Page'),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.85,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            _buildQuizCard('Fundamental Rights', Colors.teal),
            _buildQuizCard('Amendments', Colors.deepPurple),
            _buildQuizCard('QUIZISITION', Colors.orange, isQuizisition: true),
            _buildQuizCard('Preamble', Colors.blueGrey),
            _buildQuizCard('Civics', Colors.indigo),
            _buildQuizCard('Emergency Provisions', Colors.pinkAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizCard(
    String title,
    Color color, {
    bool isQuizisition = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (isQuizisition) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QuizPlay()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Opening $title Quiz (Coming Soon)')),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20, // reduced size
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
