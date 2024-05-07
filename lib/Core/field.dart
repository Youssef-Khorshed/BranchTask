import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget text_field(
        {required TextEditingController controller,
        String? hint,
        String? Function(String?)? validator,
        int? maxLines}) =>
    TextFormField(
        controller: controller,
        maxLines: maxLines ?? 1,
        validator: validator,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 2.0,
            ),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
          ),
          border: OutlineInputBorder(),
        ));
