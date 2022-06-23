import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/dropdown.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final formKey = GlobalKey<FormState>();
  String post = '';
  String visibility = 'Public';
  String album = 'Lad, The Dog';
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      appBar: AppBar(
        backgroundColor: const Color(0xff131621),
        title: Text('Create Post', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        DemoData.thisUser['photoUrl'],
                        width: 56.0,
                        height: 56.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '@${DemoData.thisUser['username']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
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
                  options: const ['Lad, The Dog', 'My birds'],
                  horizontal: true,
                  initialOption: album,
                  onChanged: (v) => setState(() => album = v),
                  convertToString: (v) => v,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: RoundedButton(
                    leading: const Icon(Icons.add_to_photos_rounded, color: Colors.white),
                    text: const Text(
                      'Choose photo',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    onTap: () {
                      snackBar(context, 'Not yet implemented');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 24.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.grey),
                    maxLines: 10,
                    decoration: InputDecoration(
                      labelText: 'Post',
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
                      post = value;
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
                RoundedButton(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
