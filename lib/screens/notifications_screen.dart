import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/widgets/notification_tile.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff131621),
        title: Text('Notifications', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
              child: Text(
                'Today',
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ),
            Column(
              children: [
                for (int i = 0; i < 2; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: NotificationTile(data: DemoData.notifications[i]),
                  ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
              child: Text(
                'Yesterday',
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                children: [
                  for (int i = 2; i < DemoData.notifications.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: NotificationTile(data: DemoData.notifications[i]),
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
