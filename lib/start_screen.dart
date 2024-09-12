
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(content) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(149, 195, 81, 229),
          ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
              color: Color.fromARGB(245, 207, 179, 237),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Color.fromARGB(255, 225, 165, 165)),
              icon: const Icon(Icons.arrow_right),
              label: const Text(
                "Start Quiz",
              ))
        ],
      ),
    );
  }
}
