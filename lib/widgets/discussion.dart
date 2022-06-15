import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/tile.dart';

class Discussion extends StatefulWidget {
  final Map<String, dynamic> data;
  const Discussion({Key? key, required this.data}) : super(key: key);

  @override
  State<Discussion> createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  bool selected = false;
  bool liked = false;
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
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
                maxLines: 3,
              ),
            ),
            Row(
              children: [
                Text(
                  widget.data['answers'] + ' Answers • ',
                  style: GoogleFonts.redHatMono(color: Colors.grey, fontSize: 12.0),
                ),
                Expanded(
                  child: Text(
                    widget.data['lastFollowed'],
                    style: GoogleFonts.redHatMono(color: Colors.grey[700], fontSize: 10.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    color: Colors.transparent,
                    padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 6.0),
                    text: const Text(
                      'Answer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                    leading: const Icon(Icons.drive_file_rename_outline_rounded, color: Colors.white, size: 18.0),
                    onTap: () {
                      snackBar(context, 'Not yet implemented');
                    },
                  ),
                  RoundedButton(
                    color: Colors.transparent,
                    padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 6.0),
                    text: const Text(
                      'Follow',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                    leading: const Icon(Icons.rss_feed_rounded, color: Colors.white, size: 18.0),
                    onTap: () {
                      snackBar(context, 'Not yet implemented');
                    },
                  ),
                  RoundedButton(
                    color: Colors.transparent,
                    padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 6.0),
                    text: const Text(
                      'Share',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                    leading: const Icon(Icons.share, color: Colors.white, size: 18.0),
                    onTap: () {
                      snackBar(context, 'Not yet implemented');
                    },
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
