
import 'package:firebaselogin/sizeconfig.dart';
import 'package:flutter/material.dart';

TextFormField textFormField(TextEditingController controller, String text) {
    return TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: text,
                  border: const OutlineInputBorder(),
                  filled: true,
                  focusedBorder:OutlineInputBorder( borderRadius: BorderRadius.circular(getFont(10))),

                  
                ),
              );
  }
