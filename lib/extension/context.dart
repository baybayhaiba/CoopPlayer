import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension BuildContexX on BuildContext {
  Future push(Widget widget) {
    return Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
    );
  }

  Size screenSize() {
    return MediaQuery.of(this).size;
  }

  void showSnackbar(String? text) {
    if (text == null) return;

    SnackBar snackBar = SnackBar(
      content: Text(
        text,
        style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
      ),
      backgroundColor: Colors.grey,
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
