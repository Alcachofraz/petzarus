import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loading(BuildContext context, {double? size, Color? color}) => Center(
      child: SpinKitThreeBounce(
        color: color ?? Theme.of(context).primaryColor,
        duration: const Duration(milliseconds: 1000),
        size: size ?? 50,
      ),
    );
