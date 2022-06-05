import 'package:flutter/material.dart';

Widget error(BuildContext context) => Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.wifi_off_rounded),
          ),
          Text('Check your connection.'),
        ],
      ),
    );
