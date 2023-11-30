import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static Text boldTextPortion({
    required String fullText,
    String? textToBold,
    Color color = const Color(0xff2c2c2c),
    double fontSize = 14,
  }) {
    final texts = fullText.split(textToBold!);
    final textSpans = List.empty(growable: true);
    texts.asMap().forEach((index, value) {
      textSpans.add(
        TextSpan(
          text: value,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            color: color,
          ),
        ),
      );
      if (index < (texts.length - 1)) {
        textSpans.add(
          TextSpan(
            text: textToBold,
            style: GoogleFonts.poppins(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        );
      }
    });
    return Text.rich(
      TextSpan(
        children: <TextSpan>[...textSpans],
      ),
    );
  }
}
