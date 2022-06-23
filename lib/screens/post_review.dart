import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/screens/profile_screen.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/image_dialog.dart';
import 'package:petzarus/widgets/input_field.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/tap_icon.dart';

class PostReviewScreen extends StatefulWidget {
  const PostReviewScreen({Key? key}) : super(key: key);

  @override
  State<PostReviewScreen> createState() => _PostReviewScreenState();
}

class _PostReviewScreenState extends State<PostReviewScreen> {
  final formKey = GlobalKey<FormState>();
  String comment = '';
  String search = '';
  int stars = 0;
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      appBar: AppBar(
        backgroundColor: const Color(0xff131621),
        title: Text('Post Recommendation', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: InputField(
                          hint: 'Search',
                          onPressed: (value) => snackBar(context, 'Speech not implemented'),
                          minimalChars: 0,
                          onChanged: (v) => search = v,
                          icon: const Icon(Icons.mic_rounded, color: Colors.white),
                        ),
                      ),
                    ),
                    const Icon(Icons.search_rounded, color: Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 24.0, right: 24.0),
                child: Material(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          'assets/images/woofgang.png',
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
                                builder: (context) => const ImageDialog(image: 'assets/images/woofgang.png'),
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
              const Padding(
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                child: Text(
                  'WOOF GANG BAKERY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 8.0),
                child: Text(
                  'Orlando, U.S.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          '4.81',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Stars(stars: 4),
                        ),
                      ],
                    ),
                    const Text(
                      '414 recommendations',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 12.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.grey),
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Comment',
                    labelStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  textCapitalization: TextCapitalization.words,
                  onChanged: (value) {
                    comment = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Invalid comment.';
                    } else if (value.length < 3) {
                      return 'Must be at least 3 characters long.';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                child: EditableStars(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 0.0),
                child: RoundedButton(
                  color: Theme.of(context).primaryColor,
                  leading: const Icon(Icons.ios_share_rounded, color: Colors.white),
                  text: const Text(
                    'Post',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      snackBar(context, 'Not yet implemented');
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: DemoData.reviews.length,
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                      builder: (context) => ProfileScreen(user: DemoData.reviews[i]['user']),
                                    ),
                                  ),
                                  text: ClipOval(
                                    child: Image.asset(
                                      DemoData.reviews[i]['user']['photoUrl'],
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
                                          DemoData.reviews[i]['user']['fullname'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16.0),
                                        ),
                                      ),
                                      Text(
                                        DemoData.reviews[i]['timestamp'],
                                        style: GoogleFonts.redHatMono(color: Colors.grey, fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Stars(stars: DemoData.reviews[i]['stars'])
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                          child: Text(
                            DemoData.reviews[i]['comment'],
                            style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ),
                        RoundedButton(
                          padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
                          matchParent: false,
                          leading: const Icon(Icons.thumb_up_rounded, color: Colors.white, size: 12.0),
                          text: const Text(
                            'Helpful?',
                            style: TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                          color: Colors.transparent,
                          onTap: () {
                            snackBar(context, 'Not yet implemented');
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Stars extends StatelessWidget {
  final int stars;
  const Stars({Key? key, required this.stars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star_rounded,
          color: stars > 0 ? Colors.yellow[800] : Colors.white,
        ),
        Icon(
          Icons.star_rounded,
          color: stars > 1 ? Colors.yellow[800] : Colors.white,
        ),
        Icon(
          Icons.star_rounded,
          color: stars > 2 ? Colors.yellow[800] : Colors.white,
        ),
        Icon(
          Icons.star_rounded,
          color: stars > 3 ? Colors.yellow[800] : Colors.white,
        ),
        Icon(
          Icons.star_rounded,
          color: stars > 4 ? Colors.yellow[800] : Colors.white,
        ),
      ],
    );
  }
}

class EditableStars extends StatefulWidget {
  const EditableStars({Key? key}) : super(key: key);

  @override
  State<EditableStars> createState() => _EditableStarsState();
}

class _EditableStarsState extends State<EditableStars> {
  int stars = 0;

  onChanged(int newStars) {
    setState(() {
      stars = newStars;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TapIcon(
          splashRadius: 0.0,
          onTap: () => onChanged(0),
          icon: Icon(
            Icons.star_rounded,
            color: stars >= 0 ? Colors.yellow[800] : Colors.white,
            size: 56.0,
          ),
        ),
        TapIcon(
          splashRadius: 0.0,
          onTap: () => onChanged(1),
          icon: Icon(
            Icons.star_rounded,
            color: stars >= 1 ? Colors.yellow[800] : Colors.white,
            size: 56.0,
          ),
        ),
        TapIcon(
          splashRadius: 0.0,
          onTap: () => onChanged(2),
          icon: Icon(
            Icons.star_rounded,
            color: stars >= 2 ? Colors.yellow[800] : Colors.white,
            size: 56.0,
          ),
        ),
        TapIcon(
          splashRadius: 0.0,
          onTap: () => onChanged(3),
          icon: Icon(
            Icons.star_rounded,
            color: stars >= 3 ? Colors.yellow[800] : Colors.white,
            size: 56.0,
          ),
        ),
        TapIcon(
          splashRadius: 0.0,
          onTap: () => onChanged(4),
          icon: Icon(
            Icons.star_rounded,
            color: stars >= 4 ? Colors.yellow[800] : Colors.white,
            size: 56.0,
          ),
        ),
      ],
    );
  }
}
