import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/screens/editable_stars.dart';
import 'package:petzarus/screens/profile_screen.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/tap_icon.dart';
import 'package:petzarus/widgets/tile.dart';

class ReadStoryScreen extends StatefulWidget {
  const ReadStoryScreen({Key? key}) : super(key: key);

  @override
  State<ReadStoryScreen> createState() => _ReadStoryScreenState();
}

class _ReadStoryScreenState extends State<ReadStoryScreen> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff131621),
        title: Text('Read Story', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Tile(
          radiusAll: 16.0,
          color: const Color(0xFF1F222C),
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0),
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
                          builder: (context) => ProfileScreen(user: DemoData.user7),
                        ),
                      ),
                      text: ClipOval(
                        child: Image.asset(
                          DemoData.user7['photoUrl'],
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
                              DemoData.user7['fullname'],
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Just now',
                                style: GoogleFonts.redHatMono(color: Colors.grey, fontSize: 10.0),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.watch_rounded, color: Colors.grey, size: 14.0),
                              ),
                              Text(
                                '8 min read',
                                style: GoogleFonts.redHatMono(color: Colors.grey, fontSize: 10.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Two older shih tzu dogs, one perfect home',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text(
                    'Two senior shih tzus, who ended up at Animal Care Centers of NYC as strays, are adopted into a forever home together.\n\n"We are absolutely not getting a dog today."\n\nThis is what David Johnston told his husband, Danny Costa, as they walked out the door on their way to an adoption event. The plan was to meet dogs to figure out what type would be best for them, so that they would be ready when the time came to adopt. In other words, they were just looking.\nDavid must have really meant what he said, because they didn\'t adopt a dog that day. They adopted two.\n\n"It was honestly one of the best decisions we\'ve ever made," says David, about adopting two senior shih tzus from Best Friends-New York (and confirming that sometimes the best of intentions don\'t happen for a reason). "They\'re just perfect for us."',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Image.asset('assets/images/read_story1.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Older dogs go from a shelter to a loving home. Sunny and Moon ended up at Animal Care Centers of NYC as strays before being taken in by Best Friends-New York.\n\nTo help Sunny and Moon make a smooth transition from the shelter to their forever home, the two dogs went to stay with a Best Friends foster mom, Lina Lerentracht, who saw their true personalities emerge as they started feeling more comfortable.\n\n"You could almost picture them as two old men," she says. "They\'d bicker at each other occasionally."  But despite their sometimes snarky moments, they wanted to cuddle and sleep with each other at night.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Image.asset('assets/images/read_story2.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    '"You could almost picture them as two old men," she says. "They\'d bicker at each other occasionally."  But despite their sometimes snarky moments, they wanted to cuddle and sleep with each other at night.\n\nLina made plans to accompany Sunny and Moon to weekend adoption events, where the adoption team hoped to find new homes for the two senior dogs.It\'s uncertain how they\'d ended up homeless in the first place. But no matter what happened in their past, Sunny and Moon deserved great homes where they could spend their golden years being loved and cared for. That\'s where, Danny and David came in.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Divider(color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TapIcon(
                          icon: Icon(
                            liked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                            size: 20.0,
                            color: liked ? Theme.of(context).primaryColor : Colors.grey,
                          ),
                          onTap: () {
                            setState(() {
                              liked = !liked;
                            });
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
                        TapIcon(
                          icon: const Icon(
                            Icons.share_outlined,
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
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            'Rate',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        EditableStars(
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
