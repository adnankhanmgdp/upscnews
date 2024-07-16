import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final dynamic _selected = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const SingleChildScrollView(
      child: Column(
        children: [
          QuizQuestion(
            question:
                "Q1. Which country recently became the newest member of the BRICS group?",
            option1: "Saudi Arabia",
            option2: "Argentina",
            option3: "Nigeria",
            option4: "Indonesia",
            correct: "a",
          ),
          QuizQuestion(
            question: "Q2. Which city hosted the G20 Summit in 2023?",
            option1: "New Delhi, India",
            option2: "Rome, Italy",
            option3: "Tokyo, Japan",
            option4: "Riyadh, Saudi Arabia",
            correct: "c",
          ),
          QuizQuestion(
            question:
                "Q3. Which organization recently launched the 'Mission LiFE' to promote sustainable living?",
            option1: "United Nations Environment Programme (UNEP)",
            option2: "World Health Organization (WHO)",
            option3: "International Solar Alliance (ISA)",
            option4: "NITI Aayog",
            correct: "d",
          ),
        ],
      ),
    ));
  }
}

class QuizQuestion extends StatefulWidget {
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String correct;
  const QuizQuestion(
      {super.key,
      required this.question,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.option4,
      required this.correct});
  @override
  State<QuizQuestion> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  dynamic _selected = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 10),
              child: Text(
                widget.question,
                style: GoogleFonts.rubik(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Colors.grey,
              height: 1,
              width: MediaQuery.of(context).size.width * 0.85,
            ),
            QuizOption("a", widget.option1, widget.correct),
            QuizOption("b", widget.option2, widget.correct),
            QuizOption("c", widget.option3, widget.correct),
            QuizOption("d", widget.option4, widget.correct),
          ],
        ),
      ),
    );
  }

  Widget QuizOption(String optionId, String option, String correct) {
    return RadioListTile(
        value: optionId,
        groupValue: _selected,
        selectedTileColor: (correct == _selected) ? Colors.green : Colors.red,
        dense: true,
        activeColor: Colors.white,
        selected: optionId == _selected,
        title: Text(
          option,
          style: GoogleFonts.rubik(
              fontSize: 14,
              color: optionId == _selected ? Colors.white : Colors.black),
        ),
        onChanged: (value) {
          if (_selected == -1) {
            setState(() {
              _selected = value;
            });
          }
        });
  }
}
