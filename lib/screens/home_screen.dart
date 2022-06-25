import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petzarus/screens/ask_screen.dart';
import 'package:petzarus/screens/create_post_screen.dart';
import 'package:petzarus/screens/groups_screen.dart';
import 'package:petzarus/screens/messages_screen.dart';
import 'package:petzarus/screens/notifications_screen.dart';
import 'package:petzarus/screens/post_review.dart';
import 'package:petzarus/screens/profile_screen.dart';
import 'package:petzarus/screens/start_campaign_screen.dart';
import 'package:petzarus/screens/trending_screen.dart';
import 'package:petzarus/screens/upload_video_screen.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/campaign.dart';
import 'package:petzarus/widgets/discussion.dart';
import 'package:petzarus/widgets/input_field.dart';
import 'package:petzarus/widgets/post.dart';
import 'package:petzarus/screens/post_story_screen.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/story.dart';
import 'package:petzarus/widgets/tile.dart';
import 'package:petzarus/widgets/video.dart';
import 'package:petzarus/widgets/video_editor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  int category = 0;
  final PageController _pageController = PageController();

  void pickVideo() async {
    final XFile? file = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (mounted && file != null) {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => VideoEditor(
            file: File(file.path),
          ),
        ),
      ).whenComplete(() {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const UploadVideoScreen(),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if ((_pageController.page ?? 0.0).toInt() == 0) {
        category = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Home(
        category: category,
      ),
      const NotificationsScreen(),
      const MessagesScreen(),
      const GroupsScreen(),
    ];
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: widgets,
            ),
          ),
        ],
      ),
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
            _pageController.animateToPage(
              i > 2 ? i - 1 : i,
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
            );
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
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CreatePostScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: Balloon(
                                text: 'Ask',
                                icon: const Icon(Icons.contact_support_rounded, color: Colors.white),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AskScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: Balloon(
                                text: 'Post Story',
                                icon: const Icon(Icons.history_edu_outlined, color: Colors.white),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PostStoryScreen(),
                                    ),
                                  );
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
                                  Navigator.pop(context);
                                  pickVideo();
                                },
                              ),
                            ),
                            Expanded(
                              child: Balloon(
                                text: 'Post Review',
                                icon: const Icon(Icons.star_outline_rounded, color: Colors.white),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PostReviewScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: Balloon(
                                text: 'Start Campaign',
                                icon: const Icon(Icons.campaign_outlined, color: Colors.white),
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const StartCampaignScreen(),
                                    ),
                                  );
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
  int category;
  Home({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool closed = false;
  String search = '';

  @override
  Widget build(BuildContext context) {
    List items = [
      if (widget.category == 1 || widget.category == 0)
        for (var post in DemoData.posts
            .where((element) => element['title'].toLowerCase().contains(search.toLowerCase()))
            .toList())
          Post(data: post),
      if (widget.category == 2 || widget.category == 0)
        for (var story in DemoData.stories
            .where((element) => element['title'].toLowerCase().contains(search.toLowerCase()))
            .toList())
          Story(data: story),
      if (widget.category == 3 || widget.category == 0)
        for (var video in DemoData.videos
            .where((element) => element['title'].toLowerCase().contains(search.toLowerCase()))
            .toList())
          Video(data: video),
      if (widget.category == 4 || widget.category == 0)
        for (var discussion in DemoData.discussions
            .where((element) => element['title'].toLowerCase().contains(search.toLowerCase()))
            .toList())
          Discussion(data: discussion),
      if (widget.category == 5 || widget.category == 0)
        for (var campaign in DemoData.campaigns
            .where((element) => element['title'].toLowerCase().contains(search.toLowerCase()))
            .toList())
          Campaign(data: campaign),
    ];

    items.sort(((a, b) => a.data['id'].compareTo(b.data['id'])));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
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
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 12.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                SquareBadge(
                  active: false,
                  icon: Image.asset(
                    'assets/images/trending.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  title: 'Trending',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TrendingScreen()));
                  },
                ),
                SquareBadge(
                  active: widget.category == 1,
                  icon: const Tile(
                    padding: EdgeInsets.all(2.0),
                    radiusAll: 4.0,
                    color: Colors.indigo,
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.receipt_rounded,
                        color: Colors.white,
                        size: 14.0,
                      ),
                    ),
                  ),
                  title: 'Posts',
                  onTap: () => setState(() => widget.category = 1),
                ),
                SquareBadge(
                  active: widget.category == 2,
                  icon: Image.asset(
                    'assets/images/stories.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  title: 'Stories',
                  onTap: () => setState(() => widget.category = 2),
                ),
                SquareBadge(
                  active: widget.category == 3,
                  icon: Image.asset(
                    'assets/images/play.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  title: 'Play',
                  onTap: () => setState(() => widget.category = 3),
                ),
                SquareBadge(
                  active: widget.category == 4,
                  icon: const Tile(
                    padding: EdgeInsets.all(2.0),
                    radiusAll: 4.0,
                    color: Colors.brown,
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.forum_rounded,
                        color: Colors.white,
                        size: 14.0,
                      ),
                    ),
                  ),
                  title: 'Discussions',
                  onTap: () => setState(() => widget.category = 4),
                ),
                SquareBadge(
                  active: widget.category == 5,
                  icon: Image.asset(
                    'assets/images/campaign.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  title: 'Campaign',
                  onTap: () => setState(() => widget.category = 5),
                ),
              ],
            ),
          ),
        ),
        if (!closed)
          Dismissible(
            key: const Key('digest'),
            onDismissed: ((direction) => closed = true),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0, left: 24.0, right: 24.0),
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
                          padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Your Weekly Digest',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'How crazy are your pets? Do you want to share some pictures?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Swipe to dismiss  '.toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Icon(Icons.east, color: Colors.white, size: 14.0),
                                  ],
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
          ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 24.0, right: 24.0),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) => items[i],
                separatorBuilder: (context, i) => const SizedBox(
                  height: 12.0,
                ),
                itemCount: items.length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SquareBadge extends StatelessWidget {
  final Widget icon;
  final bool active;
  final String title;
  final Function() onTap;
  const SquareBadge({Key? key, required this.icon, required this.title, required this.onTap, required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tile(
      padding: EdgeInsets.zero,
      radiusAll: 4.0,
      onTap: onTap,
      color: active ? const Color.fromARGB(255, 53, 58, 71) : const Color(0xFF1F222C),
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
              style: const TextStyle(color: Colors.white, fontSize: 11.0),
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
