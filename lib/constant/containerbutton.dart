
  import 'package:firebaselogin/constant/const.dart';
import 'package:firebaselogin/sizeconfig.dart';
import 'package:flutter/material.dart';

Container containerButton(String text) {
    return Container(
          alignment: Alignment.center,
          width: getWidth(120),
          height: getHeight(35),
          decoration:BoxDecoration(
            color: ColorConst.red,
            borderRadius:BorderRadius.circular(10),
          ),
          child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold),),
        );
  }