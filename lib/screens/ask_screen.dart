import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/dropdown.dart';
import 'package:petzarus/widgets/rounded_button.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/tile.dart';

class AskScreen extends StatefulWidget {
  const AskScreen({Key? key}) : super(key: key);

  @override
  State<AskScreen> createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> {
  final formKey = GlobalKey<FormState>();
  String ask = '';
  String visibility = 'Public';
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      appBar: AppBar(
        backgroundColor: const Color(0xff131621),
        title: Text('Ask', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Ask your community',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tile(
                  padding: EdgeInsets.zero,
                  color: Colors.grey[700],
                  radiusAll: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Tips on getting good answers quickly:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                          child: Text(
                            '•  Make sure your question has not been asked already;',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        Text(
                          '•  Keep your goal short and to the point;',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Text(
                            '•  Double-check grammar and spelling.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          DemoData.thisUser['photoUrl'],
                          width: 56.0,
                          height: 56.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 12.0),
                        child: Text(
                          '@${DemoData.thisUser['username']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Dropdown(
                        label: '',
                        labelColor: Colors.white,
                        options: const ['Public', 'Private'],
                        horizontal: true,
                        initialOption: visibility,
                        onChanged: (v) => setState(() => visibility = v),
                        convertToString: (v) => v,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 24.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.grey),
                    maxLines: 10,
                    decoration: InputDecoration(
                      labelText: 'Ask',
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
                      ask = value;
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
                  leading: const Icon(Icons.contact_support_rounded, color: Colors.white),
                  text: const Text(
                    'Ask',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      snackBar(context, 'Not yet implemented');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
