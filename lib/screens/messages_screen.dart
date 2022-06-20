import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/screens/chat_screen.dart';
import 'package:petzarus/screens/profile_screen.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/input_field.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/tile.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> users =
        DemoData.users.where((element) => element['fullname'].toLowerCase().contains(search.toLowerCase())).toList();
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff131621),
        title: Text('Messages', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: InputField(
              hint: 'Search',
              clearOnPressed: false,
              onPressed: (value) => snackBar(context, 'Speech not implemented'),
              minimalChars: 0,
              icon: const Icon(Icons.mic_rounded, color: Colors.white),
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
            child: Text(
              'Recently',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          SizedBox(
            height: 128.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => Padding(
                padding: EdgeInsets.only(left: i == 0 ? 16.0 : 8.0, right: i == users.length - 1 ? 16.0 : 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RoundedButton(
                      color: Colors.transparent,
                      matchParent: false,
                      padding: EdgeInsets.zero,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(user: users[i]),
                        ),
                      ),
                      text: ClipOval(
                        child: Image.asset(
                          users[i]['photoUrl'],
                          width: 96.0,
                          height: 96.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: SizedBox(
                        width: 80.0,
                        child: Text(
                          users[i]['fullname'].split(' ')[0],
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: users.length,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
            child: Text(
              'Messages',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, i) => Tile(
                padding: EdgeInsets.zero,
                radiusAll: 0.0,
                color: const Color(0xff131621),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(user: users[i]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoundedButton(
                        color: Colors.transparent,
                        matchParent: false,
                        padding: EdgeInsets.zero,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(user: users[i]),
                          ),
                        ),
                        text: ClipOval(
                          child: Image.asset(
                            users[i]['photoUrl'],
                            width: 64.0,
                            height: 64.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                users[i]['fullname'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white, fontSize: 12.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  DemoData.messages[users[i]]!.last['message'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (DemoData.messages[users[i]]!.last['new'])
                        Container(
                          height: 24.0,
                          width: 24.0,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(1024.0)),
                          child: Center(
                            child: Text(
                              DemoData.messages[users[i]]!.where((element) => element['new']).length.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              itemCount: users.length,
            ),
          ),
        ],
      ),
    );
  }
}
