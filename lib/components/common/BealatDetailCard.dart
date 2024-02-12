import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niu/screens/BealatDetail.dart';
import 'package:niu/screens/SibketDetail.dart';

class BealatDetailCard extends StatefulWidget {
  const BealatDetailCard({super.key, required this.heading, required this.detail, required this.writer});
  final String heading;
  final String detail;
  final String writer;

  @override
  State<BealatDetailCard> createState() => _BealatDetailCard();
}

class _BealatDetailCard extends State<BealatDetailCard> {
  late String heading;
  late String detail;
  late String writer;

  @override
  void initState() {
    super.initState();
    heading = widget.heading;
    detail = widget.detail;
    writer = widget.writer;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BealatDetail(),
          ),
        );
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
                heading,
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
            Text(
              detail,
            )
          ],
        ),
      ),
    );
  }
}

