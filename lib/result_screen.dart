import 'package:flutter/material.dart';

import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_summary.dart';


import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.onStop, this.onRestart, this.chosenOptions,
      {super.key});

  final void Function() onStop;
  final void Function() onRestart;
  final List<String> chosenOptions;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenOptions.length; i++) {
      summary.add({
        'index': i + 1,
        'question': questions[i].text,
        'correct_option': questions[i].options[0],
        'user_option': chosenOptions[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final total = questions.length;
    final correct = summaryData.where((data) {
      return data["user_option"] == data["correct_option"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correct out of $total questions correctly!",
              style: GoogleFonts.lato(
                color: Color.fromARGB(150, 255, 255, 255),
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: onRestart,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                label: const Text(
                  "Restart Quiz!",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(height: 10),
            TextButton.icon(
                onPressed: onStop,
                icon: const Icon(
                  Icons.stop_circle,
                  color: Colors.white,
                ),
                label: const Text(
                  "End Quiz",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
