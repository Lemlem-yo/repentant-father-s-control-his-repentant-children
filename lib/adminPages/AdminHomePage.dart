import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niu/log-authentication-pages/SignUpPage.dart';
import 'package:niu/screens/CalenderPage.dart';

import 'package:niu/screens/NotificationPage.dart';
import 'package:niu/screens/QuestionPage.dart';

import '../screens/HomePage.dart';
import 'adminScreens/AdminCalenderPage.dart';
import 'adminScreens/AdminHomePage1.dart';
import 'adminScreens/AdminNotificationPage.dart';
import 'adminScreens/AdminQuestionPage.dart';


class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _currentIndex = 0;
  List<Widget> _children = [
    AdminHomePage1(),
    AdminCalenderPage(),
    //AdminQuestionPage(),
    AdminNotificationPage(),
  ];

  void onTapBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.comment),
              onPressed: () {

              },
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromRGBO(244, 237, 213, 100),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(225, 159, 105, 0.694),
                ),
                padding: const EdgeInsets.only(bottom: 0, top: 30),
                child: Column(
                  children: const [
                    CircleAvatar(
                      foregroundImage: AssetImage("assets/images/pp.jpg"),
                      maxRadius: 50,
                    ),
                    Center(
                      child: Text(
                        "እህተ ጊዎርጊስ",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      "የግል መረጃዎች",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.gear),
                    title: Text(
                      "ማስተካከያዎች",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout_sharp),
                    title: Text(
                      "መውጫ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text(
                      "እርዳታ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.developer_board),
                    title: Text(
                      "ስለ ሠሪዎቹ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromRGBO(235, 155, 90, 79),
        body: Column(
          children: [
            Expanded(
              child: _children[_currentIndex],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 75,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              color: Color.fromRGBO(242, 208, 94, 47)),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            InkWell(
              onTap: () => setState(() {
                _currentIndex = 0;
              }),
              hoverColor: const Color.fromRGBO(217, 217, 217, 100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(
                    Icons.home,
                    size: 30,
                    color: Color.fromRGBO(241, 100, 110, 83),
                  ),
                  Text(
                    "ዋና ግጽ",
                    style: TextStyle(color: Color.fromRGBO(241, 100, 110, 83)),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                _currentIndex = 1;
              }),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(
                    Icons.calendar_month,
                    size: 30,
                    color: Color.fromRGBO(241, 100, 110, 83),
                  ),
                  Text(
                    "መርህ ግብር",
                    style: TextStyle(color: Color.fromRGBO(241, 100, 110, 83)),
                  ),
                ],
              ),
            ),
            // InkWell(
            //   onTap: () => setState(() {
            //     _currentIndex = 2;
            //   }),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: const <Widget>[
            //       Icon(
            //         Icons.question_mark_outlined,
            //         size: 30,
            //         color: Color.fromRGBO(241, 100, 110, 83),
            //       ),
            //       Text(
            //         "ጥያቄ",
            //         style: TextStyle(color: Color.fromRGBO(241, 100, 110, 83)),
            //       ),
            //     ],
            //   ),
            // ),
            InkWell(
              onTap: () => setState(() {
                _currentIndex = 2;
              }),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(
                    IconData(
                      0xe04a,
                      fontFamily: 'MaterialIcons',
                    ),
                    size: 30,
                    color: Color.fromRGBO(241, 100, 110, 83),
                  ),
                  Text(
                    "ማስታወቂያ",
                    style: TextStyle(color: Color.fromRGBO(241, 100, 110, 83)),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
