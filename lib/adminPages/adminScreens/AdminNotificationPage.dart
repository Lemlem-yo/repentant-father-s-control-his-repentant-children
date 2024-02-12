import "package:flutter/material.dart";
import '../adminComponents/notification/NotificationPost.dart';

class AdminNotificationPage extends StatelessWidget {
  const AdminNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
        scrollDirection: Axis.vertical,
        controller: controller,
        children: const [
          NotificationPost(),
          NotificationPost(),
          NotificationPost(),
          NotificationPost(),
        ]);
  }
}
