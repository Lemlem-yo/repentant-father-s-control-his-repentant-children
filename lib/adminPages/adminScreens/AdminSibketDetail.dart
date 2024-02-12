import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AdminSibketDetail extends StatefulWidget {
  final Function(String, String) updateMessagesCallback;

  const AdminSibketDetail({super.key, required this.updateMessagesCallback});

  @override
  State<AdminSibketDetail> createState() => _AdminSibketDetailState();
}

class _AdminSibketDetailState extends State<AdminSibketDetail> {
  TextEditingController _messageController = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _editingMessageId = '';

  void _sendMessage(String message) async {
    if (message.isNotEmpty) {
      String title = message.length > 15 ? message.substring(0, 15) : message;

      if (_editingMessageId.isEmpty) {
        // If not editing, add a new message
        await _firestore.collection('sbketMessage').add({
          'title': title,
          'message': message,
          'timestamp': FieldValue.serverTimestamp(),
        });
      } else {
        // If editing, update the existing message
        await _editMessage(_editingMessageId, message);
        _editingMessageId = ''; // Reset editing message ID after updating
      }

      _messageController.clear();
      widget.updateMessagesCallback(title, message);
    }
  }

  void _deleteMessage(String messageId) async {
    await _firestore.collection('sbketMessage').doc(messageId).delete();
  }

  Future<void> _editMessage(String messageId, String newMessage) async {
    await _firestore.collection('sbketMessage').doc(messageId).update({
      'message': newMessage,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
  void _startEditing(String messageId, String previousMessage) {
    _editingMessageId = messageId;
    _messageController.text = previousMessage;
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
          " ኦርቶዶክሳዊ የመዳን ትምህርት",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: _firestore.collection('sbketMessage').orderBy('timestamp').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      height: 10.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 00.0,  // Adjust the strokeWidth to control the size
                        valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(242, 208, 94, 47)),
                      ),
                    );
                  }

                  var messages = snapshot.data?.docs.reversed;

                  List<Widget> messageWidgets = [];
                  for (var message in messages!) {
                    if (message != null) {
                      final messageText = message['message'] as String? ?? '';
                      final titleText = message['title'] as String? ?? '';
                      final messageId = message.id;

                      final messageWidget = Card(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(titleText),
                          subtitle: Text(messageText),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _startEditing(messageId, messageText);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  _deleteMessage(messageId);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                      messageWidgets.add(messageWidget);
                    }
                  }

                  return ListView(
                    reverse: true,
                    children: messageWidgets,
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
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _sendMessage(_messageController.text),
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
