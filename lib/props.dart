import 'package:flutter/material.dart';

ButtonStyle buttonStyle() {
  return ButtonStyle(
      shadowColor: MaterialStateProperty.all(Colors.blueGrey.shade300),
      elevation: MaterialStateProperty.all(10),
      backgroundColor: MaterialStateProperty.all(Colors.red.shade300),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      )));
}


  List<BoxShadow> get neuBoxShadow {
    return [
      BoxShadow(
          color: Colors.grey.shade600,
          blurRadius: 7,
          offset: const Offset(-5, -5)),
      const BoxShadow(color: Colors.white, blurRadius: 7, offset: Offset(5, 5)),
    ];
  }