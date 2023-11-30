import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextfield {
  static Widget basic({
    TextEditingController? textEditingController,
    TextInputType? keyboardType = TextInputType.text,
    required String title,
    String? hint,
    Color? titleColor = Colors.black,
    Color? buttonColor,
    int? countLine,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: titleColor,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: textEditingController,
          textInputAction: TextInputAction.next,
          maxLines: countLine,
          keyboardType: keyboardType,
          onChanged: (value) {
            
          } ,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          decoration: InputDecoration(
            hintText: hint,
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          ),
        ),
      ],
    );
  }

  static Widget email({
    TextEditingController? textEditingController,
    required String tittle,
    String? hint,
    Color? buttonColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        TextFormField(
          controller: textEditingController,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          decoration: InputDecoration(
            hintText: hint,
            fillColor: Colors.white,
            filled: true,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          ),
          validator: (val) {
            if (!EmailValidator.validate(val!)) {
              return 'Masukan Email Dengan Benar';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  static Widget phone({
    TextEditingController? textEditingController,
    required String tittle,
    String? hint,
    Color? buttonColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        TextFormField(
          controller: textEditingController,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: hint,
            fillColor: Colors.white,
            filled: true,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          ),
          validator: (val) {
            if (val == null) {
              return 'Masukan Nomor Dengan Benar';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  static Widget password(
      {TextEditingController? textEditingController,
      required String tittle,
      String? hint,
      Color? buttonColor,
      required ValueNotifier<bool> valueNotifierObscureStatus}) {
    ValueNotifier<bool> valueNotifierObscure = valueNotifierObscureStatus;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        ValueListenableBuilder(
            valueListenable: valueNotifierObscure,
            builder:
                (BuildContext context, bool notifierValue, Widget? widget) {
              return TextFormField(
                controller: textEditingController,
                textInputAction: TextInputAction.done,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
                obscureText: notifierValue,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      valueNotifierObscure.value = !notifierValue;
                    },
                    child: Icon(
                      notifierValue
                          ? Icons.remove_red_eye_rounded
                          : Icons.remove_red_eye_outlined,
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                  ),
                  hintText: hint,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                ),
              );
            }),
      ],
    );
  }
}
