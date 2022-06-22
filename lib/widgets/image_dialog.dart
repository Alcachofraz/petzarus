import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class ImageDialog extends StatelessWidget {
  final String image;
  const ImageDialog({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PinchZoom(
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }
}
