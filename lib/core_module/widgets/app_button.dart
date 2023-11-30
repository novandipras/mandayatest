import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class AppButton {
  static Widget basic({
    required bool isLoading,
    Widget? prefixIcon,
    Widget? sufixIcon,
    Function()? action,
    String? title,
    TextStyle? titleStyle,
    Color? buttonColor,
  }) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: const Color(0xffdedede),
            highlightColor: const Color(0xff949494),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: buttonColor,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('',
                          style: titleStyle ??
                              GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              )),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Material(
            borderRadius: BorderRadius.circular(10),
            color: buttonColor,
            child: InkWell(
              onTap: () {
                action!();
              },
              borderRadius: BorderRadius.circular(10),
              splashColor: Colors.white.withOpacity(0.2),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      prefixIcon ?? const SizedBox(),
                      Text(
                        title!,
                        style: titleStyle ??
                            GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                      ),
                      sufixIcon ?? const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
