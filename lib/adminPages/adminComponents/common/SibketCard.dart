import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../adminScreens/AdminSibketDetail.dart';

class SibketCard extends StatefulWidget {
  const SibketCard({super.key, required this.title, required this.message, required this.writer});

  final String title;
  final String message;
  final String writer;

  @override
  State<SibketCard> createState() => _SibketCardState();
}

class _SibketCardState extends State<SibketCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _navigateToAdminSibketDetail(context);
      },
      child: Container(
        width: double.infinity,
        height: 150,
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(244, 237, 213, 100),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                Text(
                  '',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Expanded(
              child: Text(
                widget.message,
                maxLines: 3, // Adjust maxLines as needed
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAdminSibketDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AdminSibketDetail(
          updateMessagesCallback: (title, message) {
            // Handle the updated messages here if needed
          },
        ),
      ),
    );
  }
}


