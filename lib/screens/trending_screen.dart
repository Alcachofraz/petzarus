import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/widgets/discussion.dart';
import 'package:petzarus/widgets/post.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/story.dart';
import 'package:petzarus/widgets/video.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> with SingleTickerProviderStateMixin {
  int category = 0;
  String search = '';
  bool searching = false;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 5);
    tabController.addListener(() {
      setState(() {
        category = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List items = [
      if (category == 1 || category == 0)
        for (var post in DemoData.posts
            .where((element) => element['title'].toLowerCase().contains(search.toLowerCase()))
            .toList())
          Post(data: post),
      if (category == 2 || category == 0)
        for (var story in DemoData.stories
            .where((element) => element['title'].toLowerCase().contains(search.toLowerCase()))
            .toList())
          Story(data: story),
      if (category == 3 || category == 0)
        for (var video in DemoData.videos
            .where((element) => element['title'].toLowerCase().contains(search.toLowerCase()))
            .toList())
          Video(data: video),
      if (category == 4 || category == 0)
        for (var discussion in DemoData.discussions
            .where((element) => element['title'].toLowerCase().contains(search.toLowerCase()))
            .toList())
          Discussion(data: discussion),
    ];

    items.sort(((a, b) => a.data['id'].compareTo(b.data['id'])));

    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: false,
      appBar: searching
          ? AppBar(
              backgroundColor: const Color(0xff131621),
              title: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => setState(() {
                      searching = false;
                    }),
                    icon: const Icon(Icons.close_rounded, color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                },
              ),
              bottom: TabBar(
                controller: tabController,
                isScrollable: true,
                tabs: const [
                  Tab(text: 'ALL'),
                  Tab(text: 'STORIES'),
                  Tab(text: 'POSTS'),
                  Tab(text: 'VIDEOS'),
                  Tab(text: 'DISCUSSIONS'),
                ],
              ),
            )
          : AppBar(
              backgroundColor: const Color(0xff131621),
              title: Text('Trending', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
              actions: [
                IconButton(
                  onPressed: () => setState(() {
                    searching = true;
                  }),
                  icon: const Icon(Icons.search_rounded),
                )
              ],
              bottom: TabBar(
                controller: tabController,
                isScrollable: true,
                tabs: const [
                  Tab(text: 'ALL'),
                  Tab(text: 'STORIES'),
                  Tab(text: 'POSTS'),
                  Tab(text: 'VIDEOS'),
                  Tab(text: 'DISCUSSIONS'),
                ],
              ),
            ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 24.0, right: 24.0),
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
    );
  }
}
