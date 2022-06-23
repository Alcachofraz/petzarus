import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final String label;
  final List<dynamic> options;
  final dynamic initialOption;
  final bool horizontal;
  final Function(dynamic)? onChanged;
  final String Function(dynamic) convertToString;
  final Color labelColor;
  const Dropdown({
    Key? key,
    required this.label,
    required this.options,
    required this.initialOption,
    required this.onChanged,
    this.horizontal = false,
    required this.convertToString,
    this.labelColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return horizontal
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: labelColor,
                  ),
                ),
              ),
              DropdownButton<dynamic>(
                dropdownColor: const Color.fromARGB(255, 30, 34, 49),
                iconEnabledColor: Colors.grey,
                value: initialOption,
                onChanged: onChanged,
                items: [
                  for (dynamic option in options)
                    DropdownMenuItem(
                      value: option,
                      child: Text(
                        convertToString(option),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                ],
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: labelColor,
                  ),
                ),
              ),
              DropdownButton<dynamic>(
                dropdownColor: const Color.fromARGB(255, 30, 34, 49),
                iconEnabledColor: Colors.grey,
                value: initialOption,
                onChanged: onChanged,
                items: [
                  for (dynamic option in options)
                    DropdownMenuItem(
                      value: option,
                      child: Text(
                        convertToString(option),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                ],
              ),
            ],
          );
  }
}
