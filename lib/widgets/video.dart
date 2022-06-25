import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/screens/profile_screen.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/tile.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget {
  final Map<String, dynamic> data;
  const Video({Key? key, required this.data}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  bool selected = false;
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Tile(
      radiusAll: 24.0,
      padding: EdgeInsets.zero,
      color: const Color(0xFF1F222C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: widget.data['video'],
                flags: const YoutubePlayerFlags(
                  autoPlay: true,
                ),
              ),
              showVideoProgressIndicator: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
            child: Row(
              children: [
                RoundedButton(
                  color: Colors.transparent,
                  matchParent: false,
                  padding: EdgeInsets.zero,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(user: widget.data['user']),
                    ),
                  ),
                  text: ClipOval(
                    child: Image.asset(
                      widget.data['user']['photoUrl'],
                      width: 40.0,
                      height: 40.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Video. ',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ExpandableText(
                                  widget.data['title'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                  expandText: 'Read more',
                                  collapseText: 'View less',
                                  linkColor: Theme.of(context).primaryColor,
                                  linkEllipsis: false,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.data['user']['fullname'] + ' • ' + widget.data['views'] + ' • ' + widget.data['date'],
                              style: GoogleFonts.redHatMono(color: Colors.grey, fontSize: 10.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
