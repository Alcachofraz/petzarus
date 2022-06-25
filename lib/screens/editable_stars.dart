import 'package:flutter/material.dart';
import 'package:petzarus/widgets/tap_icon.dart';

class EditableStars extends StatefulWidget {
  final double size;
  const EditableStars({Key? key, this.size = 56.0}) : super(key: key);

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
            size: widget.size,
          ),
        ),
        TapIcon(
          splashRadius: 0.0,
          onTap: () => onChanged(1),
          icon: Icon(
            Icons.star_rounded,
            color: stars >= 1 ? Colors.yellow[800] : Colors.white,
            size: widget.size,
          ),
        ),
        TapIcon(
          splashRadius: 0.0,
          onTap: () => onChanged(2),
          icon: Icon(
            Icons.star_rounded,
            color: stars >= 2 ? Colors.yellow[800] : Colors.white,
            size: widget.size,
          ),
        ),
        TapIcon(
          splashRadius: 0.0,
          onTap: () => onChanged(3),
          icon: Icon(
            Icons.star_rounded,
            color: stars >= 3 ? Colors.yellow[800] : Colors.white,
            size: widget.size,
          ),
        ),
        TapIcon(
          splashRadius: 0.0,
          onTap: () => onChanged(4),
          icon: Icon(
            Icons.star_rounded,
            color: stars >= 4 ? Colors.yellow[800] : Colors.white,
            size: widget.size,
          ),
        ),
      ],
    );
  }
}
