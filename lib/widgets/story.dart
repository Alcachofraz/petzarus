import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/screens/profile_screen.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/image_dialog.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/tap_icon.dart';
import 'package:petzarus/widgets/tile.dart';

class Story extends StatefulWidget {
  final Map<String, dynamic> story;
  const Story({Key? key, required this.story}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  bool selected = false;
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Tile(
      radiusAll: 24.0,
      padding: EdgeInsets.zero,
      color: const Color(0xFF1F222C),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ExpandableText(
                widget.story['title'],
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
            Row(
              children: [
                RoundedButton(
                  color: Colors.transparent,
                  matchParent: false,
                  padding: EdgeInsets.zero,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(user: widget.story['user']),
                    ),
                  ),
                  text: ClipOval(
                    child: Image.asset(
                      widget.story['user']['photoUrl'],
                      width: 40.0,
                      height: 40.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Text(
                          widget.story['user']['fullname'],
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.story['date'],
                            style: GoogleFonts.redHatMono(color: Colors.grey, fontSize: 10.0),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.watch_rounded, color: Colors.grey, size: 14.0),
                          ),
                          Text(
                            '${widget.story['readTimeMinutes']} min read',
                            style: GoogleFonts.redHatMono(color: Colors.grey, fontSize: 10.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: ExpandableText(
                        widget.story['description'],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                        expandText: 'View more',
                        collapseText: 'View less',
                        linkColor: Theme.of(context).primaryColor,
                        linkEllipsis: false,
                        maxLines: 9,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                widget.story['image'],
                              ),
                            ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(16.0),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => ImageDialog(image: widget.story['image']),
                                    );
                                  },
                                  splashColor: Colors.white10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TapIcon(
                        icon: Icon(liked ? Icons.thumb_up : Icons.thumb_up_outlined, color: Colors.white),
                        onTap: () => setState(() => liked = !liked),
                      ),
                      Text(
                        (widget.story['likes'] + (liked ? 1 : 0)).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TapIcon(
                          icon: const Icon(Icons.mode_comment_outlined, color: Colors.white),
                          onTap: () {
                            snackBar(context, 'Not yet implemented');
                          },
                        ),
                      ),
                      Text(
                        widget.story['comments'].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TapIcon(
                    icon: const Icon(Icons.share, color: Colors.white),
                    onTap: () {
                      snackBar(context, 'Not yet implemented');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
