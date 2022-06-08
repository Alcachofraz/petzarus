import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final String image;
  const ImageDialog({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(image), fit: BoxFit.cover)),
      ),
    );
  }
}
