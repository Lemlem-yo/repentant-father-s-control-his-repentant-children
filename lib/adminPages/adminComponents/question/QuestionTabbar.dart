import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:niu/components/common/Post.dart';

class QuestionTabbar extends StatelessWidget {
  QuestionTabbar({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            const TabBar(
              indicatorColor: Color.fromRGBO(242, 208, 94, 47),
              labelColor: Colors.black,
              padding: EdgeInsets.only(bottom: 10),
              tabs: [
                Tab(icon: Icon(Icons.question_mark), text: 'ጥያቄዎች question'),
                Tab(icon: Icon(Icons.add), text: 'መልሶዎን ይጨምሩ answer the question '),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('questions').snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }

                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator(
                              strokeWidth: 2.0,  // Adjust the strokeWidth to control the size
                              valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(242, 208, 94, 47)),
                            );
                          }

                          return ListView(
                            scrollDirection: Axis.vertical,
                            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                              return Post(
                                heading: document['name'],
                                detail: document['question'],
                                writer: 'Unknown',
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: ListView(
                        children: [
                          TextField(
                            controller: questionController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                              const Color.fromRGBO(244, 237, 213, 100),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              hintText: 'ጥያቄዎትን እዚህ ጋ ይጻፉ...',
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextField(
                            controller: nameController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                              const Color.fromRGBO(244, 237, 213, 100),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              hintText: 'ክርስትና ስሞን ያስገቡ...',
                            ),
                          ),
                          SizedBox(width: 12,),
                          ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.send),
                                Text("ጥያቄውን ላክ ")
                              ],
                            ),
                            onPressed: () {
                              sendDataToFirebase();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendDataToFirebase() async {
    try {
      String name = nameController.text;
      String question = questionController.text;

      if (name.isNotEmpty && question.isNotEmpty) {
        await FirebaseFirestore.instance.collection('questions').add({
          'name': name,
          'question': question,
          'timestamp': FieldValue.serverTimestamp(),
        });
        nameController.clear();
        questionController.clear();
      } else {
        print("Name and question cannot be empty.");
      }
    } catch (e) {
      print("Error sending data to firebase: $e");
    }
  }
}
