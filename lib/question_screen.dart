import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:flutter/material.dart';
// import 'package:quiz_application/option_button.dart';
// import 'package:quiz_application/data/questions.dart';
// import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.chooseOption, {super.key});
  final void Function(String answer) chooseOption;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionsScreen> {
  var index = 0;

  void answerQuestion(String selectedOption) {
    widget.chooseOption(selectedOption);

    setState(() {
      index++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[index];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 251),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledOptions().map((item) {
              return OptionButton(item, () {
                answerQuestion(item);
              });
            })
          ],
        ),
      ),
    );
  }
}
