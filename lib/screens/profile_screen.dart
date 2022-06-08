import 'package:flutter/material.dart';
import 'package:petzarus/services/auth_service.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/image_dialog.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/tap_icon.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProfileScreen extends StatefulWidget {
  final Map<String, dynamic> user;
  const ProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24.0,
                  ),
                ),
                TapIcon(
                    icon: const Icon(Icons.logout_rounded, color: Colors.white),
                    onTap: () {
                      AuthService.auth = false;
                      Navigator.pop(context);
                    }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Image.asset(
                      widget.user['photoUrl'],
                      width: 98.0,
                      height: 98.0,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Followers: ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            widget.user['followers'].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Following: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              widget.user['following'].toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Engagement rate: ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            widget.user['engagementRate'].toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Text(
                  'Username: ',
                  style: TextStyle(color: Colors.grey, fontSize: 18.0),
                ),
                Text(
                  '@${widget.user['username']}',
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Divider(color: Colors.grey),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Text(
                              'Pets',
                              style: TextStyle(color: Colors.grey, fontSize: 18.0),
                            ),
                          ),
                          TapIcon(
                            icon: const Icon(
                              Icons.border_color_rounded,
                              color: Colors.white,
                            ),
                            onTap: () {
                              snackBar(context, 'Not yet implemented');
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Wrap(
                        spacing: 8.0,
                        children: [
                          for (String pet in widget.user['pets'])
                            Chip(
                              label: Text(
                                pet,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              backgroundColor: const Color(0xff131621),
                              shape: const StadiumBorder(
                                side: BorderSide(color: Colors.grey),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Text(
                              'Interests',
                              style: TextStyle(color: Colors.grey, fontSize: 18.0),
                            ),
                          ),
                          TapIcon(
                            icon: const Icon(
                              Icons.border_color_rounded,
                              color: Colors.white,
                            ),
                            onTap: () {
                              snackBar(context, 'Not yet implemented');
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Wrap(
                        spacing: 8.0,
                        children: [
                          for (String interest in widget.user['interests'])
                            Chip(
                              label: Text(
                                interest,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              backgroundColor: const Color(0xff131621),
                              shape: const StadiumBorder(
                                side: BorderSide(color: Colors.grey),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Divider(color: Colors.grey),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 4.0, bottom: 12.0),
                      child: Text(
                        'Activity summary',
                        style: TextStyle(color: Colors.grey, fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Questions posted: ',
                            style: TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                          Text(
                            widget.user['questionsPosted'].toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Questions marked helpful: ',
                            style: TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                          Text(
                            widget.user['markedHelpful'].toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Answers posted: ',
                            style: TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                          Text(
                            widget.user['answersPosted'].toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Top rated answers: ',
                            style: TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                          Text(
                            widget.user['topRatedAnswers'].toString(),
                            style: const TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Upvotes received: ',
                          style: TextStyle(color: Colors.grey, fontSize: 14.0),
                        ),
                        Text(
                          widget.user['upvotesReceived'].toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Divider(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Text(
                            'Photos',
                            style: TextStyle(color: Colors.grey, fontSize: 18.0),
                          ),
                        ),
                        TapIcon(
                          icon: const Icon(
                            Icons.border_color_rounded,
                            color: Colors.white,
                          ),
                          onTap: () {
                            snackBar(context, 'Not yet implemented');
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 24.0),
                      child: Wrap(
                        runSpacing: 8.0,
                        spacing: 8.0,
                        children: [
                          for (String image in widget.user['images'])
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => ImageDialog(image: image),
                                );
                              },
                              splashColor: Colors.white10,
                              child: Ink.image(
                                width: (MediaQuery.of(context).size.width - (24.0 * 2) - (8.0 * 3)) / 4,
                                height: (MediaQuery.of(context).size.width - (24.0 * 2) - (8.0 * 3)) / 4,
                                fit: BoxFit.cover,
                                image: AssetImage(image),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Text(
                            'Videos',
                            style: TextStyle(color: Colors.grey, fontSize: 18.0),
                          ),
                        ),
                        TapIcon(
                          icon: const Icon(
                            Icons.border_color_rounded,
                            color: Colors.white,
                          ),
                          onTap: () {
                            snackBar(context, 'Not yet implemented');
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 24.0),
                      child: Wrap(
                        runSpacing: 8.0,
                        spacing: 8.0,
                        children: [
                          for (String video in widget.user['videos'])
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => VideoDialog(video: video),
                                );
                              },
                              splashColor: Colors.white10,
                              child: Ink.image(
                                width: (MediaQuery.of(context).size.width - (24.0 * 2) - (8.0 * 3)) / 4,
                                height: (MediaQuery.of(context).size.width - (24.0 * 2) - (8.0 * 3)) / 4,
                                fit: BoxFit.cover,
                                image: NetworkImage('https://img.youtube.com/vi/$video/0.jpg'),
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoDialog extends StatelessWidget {
  final String video;
  const VideoDialog({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: video,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
          ),
        ),
        showVideoProgressIndicator: true,
      ),
    );
  }
}
