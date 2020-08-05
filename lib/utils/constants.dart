import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants {
  static String millisecondsToFormatString(String lastModified) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(lastModified));
    return DateFormat('HH:mm').format(dateTime);
  }

  static final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );
}