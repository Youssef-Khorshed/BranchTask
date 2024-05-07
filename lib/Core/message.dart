import 'package:flutter/material.dart';

message(
        {required BuildContext context,
        required String message,
        Color? mcolor}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: mcolor,
    ));
