import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnswerDetail extends StatefulWidget {
  final String questionId;

  const AnswerDetail({Key? key, required this.questionId}) : super(key: key);

  @override
  State<AnswerDetail> createState() => _AnswerDetailState();
}

class _AnswerDetailState extends State<AnswerDetail> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _editingAnswerId = '';
  TextEditingController _answerController = TextEditingController();

  void _sendAnswer(String answer) async {
    String answerText = _answerController.text; // Retrieve the answer from the text field

    if (answerText.isNotEmpty) {
      await _firestore.collection('answers').add({
        'questionId': widget.questionId,
        'answer': answerText,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Clear the text field after sending the answer
      _answerController.clear();
    }
  }

  void _startEditingAnswer(String answerId, String answerText) {
    // Set the _editingAnswerId to the ID of the answer being edited
    _editingAnswerId = answerId;

    // Set the text in the answer controller to the existing answer text
    _answerController.text = answerText;
  }


  void _deleteAnswer(String answerId) async {
    await _firestore.collection('answers').doc(answerId).delete();
  }

  void _editAnswer(String answerId, String newAnswer) async {
    await _firestore.collection('answers').doc(answerId).update({
      'answer': newAnswer,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromRGBO(244, 237, 213, 8),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(225, 159, 105, 0.694),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Answer Detail",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: _firestore.collection('questions').doc(widget.questionId).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator(
                    strokeWidth: 1.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(242, 208, 94, 47),
                    ),
                  );
                }

                var questionData = snapshot.data!;
                var questionTitle = questionData['name'] as String? ?? '';
                var questionText = questionData['question'] as String? ?? '';

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text(questionTitle),
                    subtitle: Text(questionText),
                  ),
                );
              },
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: _firestore.collection('answers').where('questionId', isEqualTo: widget.questionId).snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      strokeWidth: 1.0,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(242, 208, 94, 47),
                      ),
                    );
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
                      final answerId = answer.id;

                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(answerText),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _startEditingAnswer(answerId, answerText);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  _deleteAnswer(answerId);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _answerController,
                      decoration: InputDecoration(
                        hintText: 'Type your answer...',
                      ),
                      onSubmitted: (String value) {
                        _sendAnswer(value);
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      _sendAnswer(_answerController.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
