import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzarus/services/demo_data.dart';
import 'package:petzarus/utils/snackbar.dart';
import 'package:petzarus/widgets/input_field.dart';
import 'package:petzarus/widgets/screen_wrapper.dart';
import 'package:petzarus/widgets/tile.dart';

class ChatScreen extends StatefulWidget {
  final Map<String, dynamic> user;
  const ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String message = '';
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backgroundColor: const Color(0xff131621),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xff131621),
        title: Text(widget.user['fullname'], style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 2.0, left: 16.0, top: 16.0, right: 16.0),
            child: Tile(
              radiusAll: 1024.0,
              color: Color(0xff1F222C),
              onTap: null,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
                child: Text(
                  'Today',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, i) => Align(
                alignment: DemoData.messages[widget.user]![i]['me'] ? Alignment.centerRight : Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    DemoData.messages[widget.user]![i]['me'] ? 56.0 : 16.0,
                    6.0,
                    DemoData.messages[widget.user]![i]['me'] ? 16.0 : 56.0,
                    i == DemoData.messages[widget.user]!.length - 1 ? 12.0 : 6.0,
                  ),
                  child: Tile(
                    padding: EdgeInsets.zero,
                    radiusAll: 16.0,
                    color: DemoData.messages[widget.user]![i]['me']
                        ? Theme.of(context).primaryColor
                        : const Color(0xff1F222C),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                      child: Text(
                        DemoData.messages[widget.user]![i]['message'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: DemoData.messages[widget.user]!.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: InputField(
                      controller: _controller,
                      hint: 'Message...',
                      onPressed: (value) => snackBar(context, 'Media not implemented'),
                      minimalChars: 0,
                      icon: const Icon(Icons.camera_alt_rounded, color: Colors.grey),
                      onChanged: (value) {
                        setState(() {
                          message = value;
                        });
                      },
                    ),
                  ),
                ),
                FloatingActionButton.small(
                  heroTag: 'media',
                  onPressed: () {
                    snackBar(context, 'Media not implemented');
                  },
                  child: const Icon(Icons.mic, color: Colors.white),
                ),
                FloatingActionButton.small(
                  heroTag: 'send',
                  onPressed: () {
                    if (message.isNotEmpty) {
                      setState(() {
                        _controller.clear();
                        DemoData.messages[widget.user]!.add({'message': message, 'me': true, 'new': false});
                        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                      });
                    }
                  },
                  child: const Icon(Icons.send_rounded, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
