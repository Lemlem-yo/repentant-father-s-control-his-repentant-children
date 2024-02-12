import 'package:flutter/material.dart';
import '../adminComponents/question/QuestionHeading.dart';
import '../adminComponents/question/QuestionTabbar.dart';

class AdminQuestionPage extends StatelessWidget {
  const AdminQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
          width: double.infinity,
        ),
        const QuestionHeading(),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                color: Color.fromRGBO(217, 217, 217, 80)),
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children:  [
                QuestionTabbar(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
