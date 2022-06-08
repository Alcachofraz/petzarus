import 'package:flutter/material.dart';
import 'package:petzarus/screens/profile_screen.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/input_field.dart';
import 'package:petzarus/widgets/post.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> widgets = [
    const Home(),
    const Notifications(),
    const SizedBox.shrink(),
    const Chat(),
    const Friends(),
  ];
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: false,
      body: widgets[currentTabIndex],
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        color: const Color(0xFF131621),
        elevation: 16.0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: BottomNavigationBar(
          currentIndex: currentTabIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (i) => setState(() {
            currentTabIndex = i;
          }),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.notifications,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Notifications',
            ),
            const BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: 'None',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.forum_outlined,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.forum,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.groups_outlined,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.groups,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Friends',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) => GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Material(
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 98.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Balloon(
                                text: 'Create Post',
                                icon: const Icon(Icons.post_add, color: Colors.white),
                                onTap: () {
                                  snackBar(context, 'Not yet implemented');
                                },
                              ),
                            ),
                            Expanded(
                              child: Balloon(
                                text: 'Ask',
                                icon: const Icon(Icons.contact_support_rounded, color: Colors.white),
                                onTap: () {
                                  snackBar(context, 'Not yet implemented');
                                },
                              ),
                            ),
                            Expanded(
                              child: Balloon(
                                text: 'Post Story',
                                icon: const Icon(Icons.history_edu_outlined, color: Colors.white),
                                onTap: () {
                                  snackBar(context, 'Not yet implemented');
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Balloon(
                                text: 'Post Video',
                                icon: const Icon(Icons.image_outlined, color: Colors.white),
                                onTap: () {
                                  snackBar(context, 'Not yet implemented');
                                },
                              ),
                            ),
                            Expanded(
                              child: Balloon(
                                text: 'Post Review',
                                icon: const Icon(Icons.star_outline_rounded, color: Colors.white),
                                onTap: () {
                                  snackBar(context, 'Not yet implemented');
                                },
                              ),
                            ),
                            Expanded(
                              child: Balloon(
                                text: 'Start Campaign',
                                icon: const Icon(Icons.campaign_outlined, color: Colors.white),
                                onTap: () {
                                  snackBar(context, 'Not yet implemented');
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add_rounded,
          size: 32.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String search = '';
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> posts =
        DemoData.posts.where((element) => element['title'].toLowerCase().contains(search.toLowerCase())).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 8.0),
            child: Row(
              children: [
                RoundedButton(
                  color: Colors.transparent,
                  matchParent: false,
                  padding: EdgeInsets.zero,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(user: DemoData.thisUser),
                    ),
                  ),
                  text: ClipOval(
                    child: Image.asset(
                      DemoData.thisUser['photoUrl'],
                      width: 56.0,
                      height: 56.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 12.0),
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
                ),
                const Icon(Icons.search_rounded, color: Colors.white),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      SquareBadge(
                        icon: Image.asset(
                          'assets/images/fire.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                        title: 'Trending',
                        onTap: () {
                          snackBar(context, 'Not yet implemented');
                        },
                      ),
                      SquareBadge(
                        icon: const Icon(Icons.newspaper_rounded, color: Colors.white),
                        title: 'Stories',
                        onTap: () {
                          snackBar(context, 'Not yet implemented');
                        },
                      ),
                      SquareBadge(
                        icon: const Icon(Icons.campaign_rounded, color: Colors.white),
                        title: 'TBA',
                        onTap: () {
                          snackBar(context, 'Not yet implemented');
                        },
                      ),
                      SquareBadge(
                        icon: const Icon(Icons.handshake_rounded, color: Colors.white),
                        title: 'Community Service',
                        onTap: () {
                          snackBar(context, 'Not yet implemented');
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Tile(
                      onTap: () {
                        snackBar(context, 'Not yet implemented');
                      },
                      padding: EdgeInsets.zero,
                      radiusAll: 4.0,
                      color: const Color(0xFF1F222C),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 12.0),
                        child: Row(
                          children: [
                            const Icon(Icons.forward_to_inbox_rounded, color: Colors.white, size: 36.0),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Your Weekly Digest',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'How crazy are your pets? Do you want to share some pictures?',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 24.0),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) => Post(post: posts[i]),
                      separatorBuilder: (context, i) => const SizedBox(
                        height: 12.0,
                      ),
                      itemCount: posts.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Not yet implemented',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Not yet implemented',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Not yet implemented',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class SquareBadge extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function() onTap;
  const SquareBadge({Key? key, required this.icon, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tile(
      padding: EdgeInsets.zero,
      radiusAll: 4.0,
      onTap: onTap,
      color: const Color(0xFF1F222C),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: icon,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Balloon extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Icon icon;
  const Balloon({Key? key, required this.text, required this.onTap, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: onTap,
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Tile(
              radiusAll: 16.0,
              color: const Color(0xFF1F222C),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6.0, 3.0, 6.0, 4.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
