import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:petzarus/screens/campaign_screen.dart';
import 'package:petzarus/screens/profile_screen.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/tile.dart';

class Campaign extends StatefulWidget {
  final Map<String, dynamic> data;
  const Campaign({Key? key, required this.data}) : super(key: key);

  @override
  State<Campaign> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Tile(
      radiusAll: 24.0,
      padding: EdgeInsets.zero,
      color: const Color(0xFF1F222C),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CampaignScreen(campaign: widget.data),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
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
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Text(
                      widget.data['user']['fullname'],
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16.0),
                    ),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Campaign. ',
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
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            ExpandableText(
              widget.data['description'],
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
              expandText: 'View more',
              collapseText: 'View less',
              linkColor: Theme.of(context).primaryColor,
              linkEllipsis: false,
              maxLines: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$${widget.data['raised']} USD ',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' raised of \$${widget.data['toRaise']} goal',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: LinearProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.green[900],
                value: widget.data['raised'] / widget.data['toRaise'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
