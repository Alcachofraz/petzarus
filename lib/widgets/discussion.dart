import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/screens/profile_screen.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/tap_icon.dart';
import 'package:petzarus/widgets/tile.dart';
import 'dart:math' as math;

class Discussion extends StatefulWidget {
  final Map<String, dynamic> data;
  const Discussion({Key? key, required this.data}) : super(key: key);

  @override
  State<Discussion> createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  bool upvoted = false;
  bool downvoted = false;

  @override
  Widget build(BuildContext context) {
    return Tile(
      radiusAll: 24.0,
      padding: EdgeInsets.zero,
      color: const Color(0xFF1F222C),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: Text(
                            widget.data['user']['fullname'],
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14.0),
                          ),
                        ),
                        Text(
                          widget.data['userDescription'],
                          style: GoogleFonts.redHatMono(color: Colors.grey, fontSize: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Ask. ',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ExpandableText(
                      widget.data['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      expandText: 'Read more',
                      collapseText: 'View less',
                      linkColor: Theme.of(context).primaryColor,
                      linkEllipsis: false,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ExpandableText(
                      widget.data['description'],
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                      expandText: 'Read more',
                      collapseText: 'View less',
                      linkColor: Theme.of(context).primaryColor,
                      linkEllipsis: false,
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Tile(
                      radiusAll: 1024,
                      color: const Color.fromARGB(255, 47, 49, 56),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.rotate(
                            angle: 270 * math.pi / 180,
                            child: TapIcon(
                              icon: Icon(
                                upvoted ? Icons.forward_rounded : Icons.forward_outlined,
                                size: 20.0,
                                color: upvoted ? Theme.of(context).primaryColor : Colors.grey,
                              ),
                              onTap: () {
                                setState(() {
                                  upvoted = !upvoted;
                                });
                              },
                            ),
                          ),
                          Text(
                            '${widget.data['upvotes'] + (upvoted ? 1 : 0)}',
                            style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                          Transform.rotate(
                            angle: 90 * math.pi / 180,
                            child: TapIcon(
                              icon: Icon(
                                downvoted ? Icons.forward_rounded : Icons.forward_outlined,
                                size: 20.0,
                                color: downvoted ? Theme.of(context).primaryColor : Colors.grey,
                              ),
                              onTap: () {
                                setState(() {
                                  downvoted = !downvoted;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    TapIcon(
                      icon: const Icon(
                        Icons.refresh_rounded,
                        size: 20.0,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        snackBar(context, 'Not yet implemented');
                      },
                    ),
                    TapIcon(
                      icon: const Icon(
                        Icons.chat_bubble_outline_rounded,
                        size: 20.0,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        snackBar(context, 'Not yet implemented');
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TapIcon(
                      icon: const Icon(
                        Icons.share,
                        size: 20.0,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        snackBar(context, 'Not yet implemented');
                      },
                    ),
                    TapIcon(
                      icon: const Icon(
                        Icons.more_horiz_rounded,
                        size: 20.0,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        snackBar(context, 'Not yet implemented');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
