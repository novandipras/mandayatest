
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextItem extends StatelessWidget {
  const AppTextItem({super.key, this.title, this.data});

  final String? title;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 20,
          child: Text(title ?? '',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 10,
              )),
        ),
        Expanded(
          flex: 5,
          child: title!.isNotEmpty
              ? Text(':',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 10,
              ))
              : const SizedBox(),
        ),
        Expanded(
          flex: 70,
          child: Text(data ?? '',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.normal,
                fontSize: 10,
                color: title!.isNotEmpty ? Colors.black : Colors.grey
              )),
        ),
      ],
    );
  }
}
