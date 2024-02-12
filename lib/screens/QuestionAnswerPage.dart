import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionAnswerPage extends StatelessWidget {
  final String questionId;

  const QuestionAnswerPage({Key? key, required this.questionId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 237, 213, 8),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(225, 159, 105, 0.694),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Question and Answer",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection('questions').doc(questionId).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                var questionData = snapshot.data!;
                var questionTitle = questionData['name'] as String? ?? '';
                var questionText = questionData['question'] as String? ?? '';

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      questionTitle,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      questionText,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance.collection('answers').where('questionId', isEqualTo: questionId).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  var answers = snapshot.data?.docs ?? [];

                  if (answers.isEmpty) {
                    return Text('No answers found.');
                  }

                  return ListView.builder(
                    itemCount: answers.length,
                    itemBuilder: (context, index) {
                      var answer = answers[index];
                      final answerText = answer['answer'] as String? ?? '';

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Answer ${index + 1}:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            answerText,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
