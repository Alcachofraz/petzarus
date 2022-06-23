import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/tile.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
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
            Tile(
              padding: EdgeInsets.zero,
              radiusBottomRight: 16.0,
              radiusBottomLeft: 16.0,
              color: const Color(0xFF1F222C),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                DemoData.thisUser['photoUrl'],
                                width: 56.0,
                                height: 56.0,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Groups',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.search, color: Colors.white),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Your groups',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                'Recently visited',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down, color: Colors.grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                      child: Row(
                        children: [
                          RoundedButton(
                            padding: const EdgeInsets.fromLTRB(8, 6, 10, 6),
                            strokeOnly: true,
                            color: Theme.of(context).primaryColor,
                            text: Text('Create', style: TextStyle(color: Theme.of(context).primaryColor)),
                            leading: Icon(Icons.add_circle_outline, color: Theme.of(context).primaryColor),
                            onTap: () {
                              snackBar(context, 'Not yet implemented');
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: RoundedButton(
                              padding: const EdgeInsets.fromLTRB(8, 6, 10, 6),
                              strokeOnly: true,
                              color: Theme.of(context).primaryColor,
                              text: Text('Discover', style: TextStyle(color: Theme.of(context).primaryColor)),
                              leading: Icon(Icons.explore, color: Theme.of(context).primaryColor),
                              onTap: () {
                                snackBar(context, 'Not yet implemented');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Text(
                'Discover Groups',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 2.0, left: 16.0, right: 16.0),
              child: Text(
                'Spaces you might like',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: [
                  for (var group in DemoData.groups)
                    Tile(
                      onTap: () {},
                      radiusAll: 12.0,
                      color: const Color(0xFF1F222C),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                group['image'],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
                                child: Text(
                                  group['title'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0, left: 16.0, right: 16.0),
                                child: Text(
                                  group['description'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 64.0),
                            child: Center(
                              child: ClipOval(
                                child: Image.asset(
                                  group['profile'],
                                  width: 56.0,
                                  height: 56.0,
                                ),
                              ),
                            ),
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
