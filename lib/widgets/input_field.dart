import 'package:flutter/material.dart';
import 'package:petzarus/widgets/tap_icon.dart';

class InputField extends StatefulWidget {
  final int minimalChars;
  final Function(String)? onPressed;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Icon icon;
  final String? hint;
  final TextCapitalization textCapitalization;
  final EdgeInsets padding;
  final bool clearOnPressed;

  const InputField({
    Key? key,
    required this.minimalChars,
    this.onPressed,
    required this.icon,
    this.onChanged,
    this.hint,
    this.textCapitalization = TextCapitalization.sentences,
    this.padding = EdgeInsets.zero,
    this.clearOnPressed = false,
    this.controller,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String text = "";
  bool emojiPickerShowing = false;
  late TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    _controller = widget.controller ?? TextEditingController();
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 8.0,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF1F222C),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.text,
                      textCapitalization: widget.textCapitalization,
                      maxLength: 100,
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        if (widget.onChanged != null) {
                          widget.onChanged!.call(value);
                        }
                        setState(() {
                          text = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: widget.hint,
                        hintStyle: const TextStyle(color: Colors.grey),
                        counterText: "",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: text.length >= widget.minimalChars
                        ? TapIcon(
                            icon: widget.icon,
                            onTap: () {
                              if (widget.clearOnPressed) _controller.clear();
                              if (widget.onPressed != null) {
                                widget.onPressed!.call(text);
                              }
                            },
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
