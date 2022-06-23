import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/screens/profile_screen.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/image_dialog.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'dart:math' as math;

import 'package:petzarus/widgets/tile.dart';

class CampaignScreen extends StatefulWidget {
  final Map<String, dynamic> campaign;
  const CampaignScreen({Key? key, required this.campaign}) : super(key: key);

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  bool seeAll = false;
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff131621),
        title: Text('Campaign', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0, bottom: 16.0),
              child: Center(
                child: Text(
                  'We are live!',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 8.0),
              child: Text(
                'Veterinary Mission for refugee animals in NY Shelters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 16.0, bottom: 16.0),
              child: Material(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.transparent,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        widget.campaign['image'],
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
                              builder: (context) => ImageDialog(image: widget.campaign['image']),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, top: 12.0, left: 24.0, right: 24.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$${widget.campaign['raised']} USD ',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' raised of \$${widget.campaign['toRaise']} goal',
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
              padding: const EdgeInsets.only(bottom: 16.0, left: 24.0, right: 24.0),
              child: LinearProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.green[900],
                value: widget.campaign['raised'] / widget.campaign['toRaise'],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 8.0, top: 8.0),
              child: Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: [
                  RoundedButton(
                    matchParent: false,
                    padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12, 8),
                    color: Theme.of(context).primaryColor,
                    leading: const Icon(Icons.share, color: Colors.white, size: 18.0),
                    text: const Text(
                      'Share',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    onTap: () {
                      snackBar(context, 'Not yet implemented');
                    },
                  ),
                  RoundedButton(
                    matchParent: false,
                    padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12, 8),
                    color: Theme.of(context).primaryColor,
                    leading: const Icon(Icons.toll_rounded, color: Colors.white, size: 18.0),
                    text: const Text(
                      'Donate',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    onTap: () {
                      snackBar(context, 'Not yet implemented');
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0, bottom: 16.0),
              child: Text(
                'Donations',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 8.0),
              child: Text(
                '${widget.campaign['donations'].length} donations',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, i) => const SizedBox(height: 8.0),
                itemCount:
                    seeAll ? widget.campaign['donations'].length : math.min(2, widget.campaign['donations'].length),
                shrinkWrap: true,
                itemBuilder: (context, i) => Row(
                  children: [
                    RoundedButton(
                      color: Colors.transparent,
                      matchParent: false,
                      padding: EdgeInsets.zero,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(user: widget.campaign['donations'][i]['user']),
                        ),
                      ),
                      text: ClipOval(
                        child: Image.asset(
                          widget.campaign['donations'][i]['user']['photoUrl'],
                          width: 18.0,
                          height: 18.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        widget.campaign['donations'][i]['user']['fullname'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        '\$${widget.campaign['donations'][i]['amount']}',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Text(
                      widget.campaign['donations'][i]['timestamp'],
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    seeAll = !seeAll;
                  });
                },
                child: Text(
                  seeAll ? 'See Less' : 'See All',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 4.0, bottom: 16.0),
              child: Text(
                'Campaign Description',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
              child: Text(
                widget.campaign['description'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 4.0, bottom: 16.0),
              child: Text(
                'Organizer',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, left: 24.0, bottom: 16.0),
              child: Row(
                children: [
                  RoundedButton(
                    matchParent: false,
                    padding: EdgeInsets.zero,
                    color: Colors.transparent,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(user: widget.campaign['user']),
                      ),
                    ),
                    text: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            widget.campaign['user']['photoUrl'],
                            width: 44.0,
                            height: 44.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            '@${widget.campaign['user']['username']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Wrap(
                      spacing: 12.0,
                      runSpacing: 12.0,
                      children: [
                        Tile(
                          color: Colors.green[800],
                          radiusAll: 1024,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12, 8),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 6.0),
                                  child: Icon(Icons.check_rounded, color: Colors.white, size: 16.0),
                                ),
                                Text(
                                  'ID Verified',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: RoundedButton(
                            matchParent: false,
                            padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12, 8),
                            color: Theme.of(context).primaryColor,
                            text: const Text(
                              'Contact',
                              style: TextStyle(color: Colors.white, fontSize: 14.0),
                            ),
                            onTap: () {
                              snackBar(context, 'Not yet implemented');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 4.0, bottom: 16.0),
              child: Text(
                'Volunteers',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      for (var user in widget.campaign['volunteers'])
                        ClipOval(
                          child: Image.asset(
                            user['photoUrl'],
                            width: 40.0,
                            height: 40.0,
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: RoundedButton(
                      matchParent: false,
                      padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12, 8),
                      color: Theme.of(context).primaryColor,
                      leading: const Icon(Icons.celebration_rounded, color: Colors.orange),
                      text: const Text(
                        'Send Motivation',
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                      onTap: () {
                        snackBar(context, 'Not yet implemented');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 4.0, bottom: 16.0),
              child: Text(
                'Campaign Sponsors',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      for (var user in widget.campaign['sponsors'])
                        ClipOval(
                          child: Image.asset(
                            user['photoUrl'],
                            width: 40.0,
                            height: 40.0,
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: RoundedButton(
                      matchParent: false,
                      padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12, 8),
                      color: Theme.of(context).primaryColor,
                      leading: const Icon(Icons.bookmark_rounded, color: Colors.red),
                      text: const Text(
                        'Send Respect',
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                      onTap: () {
                        snackBar(context, 'Not yet implemented');
                      },
                    ),
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
