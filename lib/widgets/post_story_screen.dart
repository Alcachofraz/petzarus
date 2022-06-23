import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/tile.dart';

class PostStoryScreen extends StatefulWidget {
  const PostStoryScreen({Key? key}) : super(key: key);

  @override
  State<PostStoryScreen> createState() => _PostStoryScreenState();
}

class _PostStoryScreenState extends State<PostStoryScreen> {
  late quill.QuillController _controller;

  @override
  void initState() {
    super.initState();
    _controller = quill.QuillController.basic();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff131621),
        title: Text('Create Story', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
      ),
      body: Tile(
        padding: const EdgeInsets.all(16.0),
        radiusAll: 24.0,
        color: const Color(0xFF1F222C),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: quill.QuillToolbar.basic(
                  toolbarSectionSpacing: 2.0,
                  toolbarIconSize: 14.0,
                  controller: _controller,
                  dialogTheme: quill.QuillDialogTheme(
                    dialogBackgroundColor: const Color(0xFF1F222C),
                    labelTextStyle: const TextStyle(color: Colors.white),
                    inputTextStyle: const TextStyle(color: Colors.white),
                  ),
                  iconTheme: const quill.QuillIconTheme(
                    iconUnselectedColor: Colors.white,
                    iconUnselectedFillColor: Color(0xff131621),
                  ),
                ),
              ),
            ),
            const Divider(
              color: Color(0xff131621),
              thickness: 2.0,
            ),
            Expanded(
              child: quill.QuillEditor(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                controller: _controller,
                readOnly: false,
                scrollController: ScrollController(),
                expands: true,
                focusNode: FocusNode(),
                scrollable: true,
                autoFocus: false,
                customStyles: quill.DefaultStyles(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
