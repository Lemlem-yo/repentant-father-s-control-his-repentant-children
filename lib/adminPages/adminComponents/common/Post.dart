import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niu/screens/SibketDetail.dart';


class Post extends StatefulWidget {
  const Post({Key? key, required this.heading, required this.detail, required this.writer}) : super(key: key);

  final String heading;
  final String detail;
  final String writer;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
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
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(244, 237, 213, 100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 5),
          Text(
            detail,
          ),
        ],
      ),
    );
  }
}


