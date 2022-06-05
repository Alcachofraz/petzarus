import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final Widget? leading;
  final Widget? text;
  final Function()? onTap;
  final bool strokeOnly;
  final bool matchParent;
  final EdgeInsets padding;
  final List<Color>? gradient;
  final double borderRadius;
  const RoundedButton({
    Key? key,
    this.color = Colors.blue,
    this.leading,
    this.text,
    required this.onTap,
    this.strokeOnly = false,
    this.matchParent = true,
    this.padding = const EdgeInsets.fromLTRB(20.0, 14.0, 20.0, 16.0),
    this.gradient,
    this.borderRadius = 1024,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: strokeOnly ? Colors.transparent : color,
        gradient: gradient != null
            ? LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: gradient!,
              )
            : null,
        border: strokeOnly ? Border.all(color: color, width: 2) : null,
      ),
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor: strokeOnly ? color.withOpacity(0.4) : Colors.grey.withOpacity(0.5),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: matchParent ? MainAxisSize.max : MainAxisSize.min,
              children: [
                if (leading != null)
                  Padding(
                    padding: text != null ? const EdgeInsets.only(right: 12.0) : EdgeInsets.zero,
                    child: leading!,
                  ),
                if (text != null) text!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
