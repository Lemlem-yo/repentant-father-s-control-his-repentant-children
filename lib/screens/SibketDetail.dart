import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SibketDetail extends StatefulWidget {
  const SibketDetail({
    Key? key,
    required this.title,
    required this.message,
    required this.writer,
  }) : super(key: key);

  final String title;
  final String message;
  final String writer;

  @override
  State<SibketDetail> createState() => _SibketDetailState();
}

class _SibketDetailState extends State<SibketDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromRGBO(244, 237, 213, 8),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(225, 159, 105, 0.694),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: Navigator.of(context).pop,
        ),
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '', // You can display additional info here if needed
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '', // You can display additional info here if needed
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    widget.message,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
