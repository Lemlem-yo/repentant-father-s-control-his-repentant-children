import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:niu/components/common/BealatDetailCard.dart';
import 'package:niu/components/common/SibketCard.dart';
import 'package:niu/components/home/Body.dart';

import '../common/MezmurCard.dart';
import '../common/Post.dart';

class HomeSubHeading extends StatelessWidget {
  const HomeSubHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            const TabBar(
              indicatorColor: Color.fromRGBO(242, 208, 94, 47),
              labelColor: Colors.black,
              padding: EdgeInsets.only(bottom: 10),
              tabs: [
                Tab(icon: Icon(Icons.music_note), text: 'ስብከት'),
                Tab(icon: Icon(Icons.movie), text: 'መዝሙር'),
                Tab(icon: Icon(Icons.book), text: 'በዓላት'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  StreamBuilder(
                    stream: getSibketMessages(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator(
                          strokeWidth: 2.0,  // Adjust the strokeWidth to control the size
                          valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(242, 208, 94, 47)),
                        ); // Loading indicator
                      }

                      var messages = snapshot.data?.docs;

                      return Container(
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: messages?.length ?? 0,
                          itemBuilder: (context, index) {
                            var message = messages?[index];
                            var title = message?['title'] as String? ?? '';
                            var messageText = message?['message'] as String? ?? '';


                            return SibketCard(
                              title: title,
                              message: messageText,
                              writer: "",
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    // height: 500,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: const [
                        MezmurCard(heading:"በድንኳኔ እልልታህ ሙሉ ነው", detail:"መጋቢት 2 ከምሽቱ 11 ሰዓት ላይ የ ማርያም ዝክር ስልሚኖር ሁላችሁም እንድትገኙ።\nየቻላችሁትን 5 10 ይዛችሁ ኑ..."),
                      ],
                    ),
                  ),
                  SizedBox(
                    // height: 500,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children:  [
                        BealatDetailCard(heading:"ሳምንታዊ የዝክረ ቅዱሳን መርሐግብር",
                            detail:"በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ አሜን።ጥር ፩ በዝህች ቀን  የሰማዕታት መጀመሪያ ሊቀ ዲያቆናት ቅዱስ እስጥፋኖስ በሰማዕትነት አረፈ። ",
                            writer: "aba gobena",
                        ),

                      ],
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
}
//
Stream<QuerySnapshot> getSibketMessages() {
  return FirebaseFirestore.instance.collection('sbketMessage').snapshots();
}

