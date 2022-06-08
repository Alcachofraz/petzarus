import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/screens/profile_screen.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/image_dialog.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/tap_icon.dart';
import 'package:petzarus/widgets/tile.dart';

class Post extends StatefulWidget {
  final Map<String, dynamic> post;
  const Post({Key? key, required this.post}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool selected = false;
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Tile(
      radiusAll: 24.0,
      padding: EdgeInsets.zero,
      color: const Color(0xFF1F222C),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
        child: Column(
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
                      builder: (context) => ProfileScreen(user: widget.post['user']),
                    ),
                  ),
                  text: ClipOval(
                    child: Image.asset(
                      widget.post['user']['photoUrl'],
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
                          widget.post['user']['fullname'],
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                      Text(
                        widget.post['date'],
                        style: GoogleFonts.redHatMono(color: Colors.grey, fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                FilterChip(
                  label: const Text('Follow', style: TextStyle(color: Colors.grey)),
                  backgroundColor: const Color(0xFF1F222C),
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.grey),
                  ),
                  selected: selected,
                  selectedColor: const Color(0xFF1F222C),
                  checkmarkColor: Theme.of(context).primaryColor,
                  onSelected: (value) {
                    setState(() {
                      selected = value;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ExpandableText(
                widget.post['title'],
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
            ExpandableText(
              widget.post['description'],
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
              expandText: 'View more',
              collapseText: 'View less',
              linkColor: Theme.of(context).primaryColor,
              linkEllipsis: false,
              maxLines: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Material(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.transparent,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        widget.post['image'],
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
                              builder: (context) => ImageDialog(image: widget.post['image']),
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
                        (widget.post['likes'] + (liked ? 1 : 0)).toString(),
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
                        widget.post['comments'].toString(),
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
