import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/dropdown.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/tap_icon.dart';
import 'package:petzarus/widgets/tile.dart';
import 'package:petzarus/widgets/video_editor.dart';

class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({Key? key}) : super(key: key);

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  int state = 0;
  String title = '';
  String audience = 'Everyone';
  String visibility = 'Public';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      onBack: () {
        if (state == 0) {
          return true;
        } else {
          setState(() {
            state--;
          });
          return false;
        }
      },
      backgroundColor: const Color(0xff131621),
      appBar: AppBar(
        backgroundColor: const Color(0xff131621),
        title: Text('Upload Video', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      color: const Color(0xFF1F222C),
                      child: SizedBox(
                        child: UploadedVideoCoverHolder.cover != null
                            ? Image.memory(
                                UploadedVideoCoverHolder.cover!.readAsBytesSync(),
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              )
                            : const SizedBox(
                                height: 80,
                                width: 80,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text('No cover'),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.grey),
                          maxLines: 2,
                          decoration: InputDecoration(
                            labelText: 'Title',
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
                            title = value;
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
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Tile(
                    color: const Color(0xFF1F222C),
                    radiusAll: 16.0,
                    padding: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                      child: Column(
                        children: [
                          Dropdown(
                            label: 'Visibility',
                            labelColor: Colors.white,
                            options: const ['Public', 'Private'],
                            horizontal: true,
                            initialOption: visibility,
                            onChanged: (v) => setState(() => visibility = v),
                            convertToString: (v) => v,
                          ),
                          Dropdown(
                            label: 'Album',
                            labelColor: Colors.white,
                            options: const ['Everyone', 'Above 18'],
                            horizontal: true,
                            initialOption: audience,
                            onChanged: (v) => setState(() => audience = v),
                            convertToString: (v) => v,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text:
                                        'Regardless of your location, you\'re legally required to comply with the US Children\'s Online Privacy Protection Act (COPPA) and/or other laws. You\'re required to tell us whether your videos are Made for Kids. ',
                                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                                  ),
                                  TextSpan(
                                    text: 'What\'s content Made for Kids?',
                                    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                const Icon(Icons.comment_outlined, color: Colors.grey),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Comments',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Hold potentially inappropriate comment...',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TapIcon(
                                  icon: const Icon(
                                    Icons.chevron_right_rounded,
                                    color: Colors.grey,
                                    size: 32.0,
                                  ),
                                  onTap: () {},
                                  splashRadius: 0.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: RoundedButton(
                    color: Theme.of(context).primaryColor,
                    leading: const Icon(Icons.ios_share_rounded, color: Colors.white),
                    text: const Text(
                      'Upload',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        snackBar(context, 'Not yet implemented');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
