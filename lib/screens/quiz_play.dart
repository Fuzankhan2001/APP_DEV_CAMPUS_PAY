import 'dart:async';
import 'package:flutter/material.dart';

class QuizPlay extends StatefulWidget {
  const QuizPlay({super.key});

  @override
  State<QuizPlay> createState() => _QuizPlayState();
}

class _QuizPlayState extends State<QuizPlay> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question':
          'What does the Preamble of the Indian Constitution declare India to be?',
      'options': ['Monarchy', 'Dictatorship', 'Republic', 'Oligarchy'],
      'answer': 'Republic',
    },
    {
      'question':
          'Which part of the Constitution deals with Fundamental Rights?',
      'options': ['Part I', 'Part III', 'Part V', 'Part IV'],
      'answer': 'Part III',
    },
    {
      'question':
          'How many amendments have been made to the Indian Constitution so far (approx)?',
      'options': ['50', '75', '100+', '20'],
      'answer': '100+',
    },
    {
      'question': 'Who is known as the Father of the Indian Constitution?',
      'options': ['Mahatma Gandhi', 'Sardar Patel', 'B. R. Ambedkar', 'Nehru'],
      'answer': 'B. R. Ambedkar',
    },
    {
      'question': 'Which article guarantees the Right to Equality?',
      'options': ['Article 14', 'Article 21', 'Article 32', 'Article 19'],
      'answer': 'Article 14',
    },
    {
      'question': 'Directive Principles are listed in which part?',
      'options': ['Part III', 'Part IV', 'Part V', 'Part I'],
      'answer': 'Part IV',
    },
    {
      'question': 'What does DPSP stand for?',
      'options': [
        'Development Plan',
        'Directive Principles of State Policy',
        'Democratic Policy',
        'None',
      ],
      'answer': 'Directive Principles of State Policy',
    },
    {
      'question': 'Emergency provisions are in which part of the Constitution?',
      'options': ['Part XVIII', 'Part IX', 'Part VI', 'Part XX'],
      'answer': 'Part XVIII',
    },
    {
      'question': 'Which body interprets the Constitution?',
      'options': ['Parliament', 'Supreme Court', 'President', 'Cabinet'],
      'answer': 'Supreme Court',
    },
    {
      'question': 'What is the minimum age for voting in India?',
      'options': ['18', '21', '25', '16'],
      'answer': '18',
    },
  ];

  int _currentIndex = 0;
  int _score = 0;
  int _timer = 15;
  String _feedback = '';
  Timer? _countdownTimer;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = 15;
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timer > 0) {
          _timer--;
        } else {
          _countdownTimer?.cancel();
          _feedback = 'Time\'s up!';
          _answered = true;
        }
      });
    });
  }

  void _checkAnswer(String selected) {
    if (_answered) return;
    _countdownTimer?.cancel();
    setState(() {
      _answered = true;
      if (selected == _questions[_currentIndex]['answer']) {
        _score += 10;
        _feedback = 'Correct!';
      } else {
        _feedback = 'Wrong!';
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _feedback = '';
        _answered = false;
      });
      _startTimer();
    } else {
      _countdownTimer?.cancel();
      _showFinalScore();
    }
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Text('Your Score: $_score / 100'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to previous screen
            },
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = _questions[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Quizisition"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${_currentIndex + 1} of ${_questions.length}",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: _timer / 15,
              backgroundColor: Colors.white30,
              color: Colors.amber,
            ),
            const SizedBox(height: 20),
            Text(
              current['question'],
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            ...current['options'].map<Widget>((opt) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  onPressed: () => _checkAnswer(opt),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _answered
                        ? (opt == current['answer']
                              ? Colors.green
                              : Colors.redAccent)
                        : Colors.amber,
                  ),
                  child: Text(opt, style: const TextStyle(color: Colors.black)),
                ),
              );
            }).toList(),
            const SizedBox(height: 10),
            if (_feedback.isNotEmpty)
              Text(
                _feedback,
                style: TextStyle(
                  color: _feedback == 'Correct!' ? Colors.green : Colors.red,
                  fontSize: 18,
                ),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: _nextQuestion,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              child: Text(
                _currentIndex == _questions.length - 1 ? 'Finish' : 'Next',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Live Score: $_score",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
