import 'package:demo_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  static Text headlineBoldText(String text, {Color? color}) {
    return Text(text,
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: color ?? AppColors.textColorDark,
        ));
  }

  static Text headlineNormalText(String text, {Color? color}) {
    return Text(text,
        style: GoogleFonts.poppins(
          fontSize: 24,
          color: color ?? AppColors.textColorDark,
        ));
  }

  static Text homeHederText(String text, {Color? color}) {
    return Text(text,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: color ?? AppColors.textColorDark,
        ));
  }

  static Text smallText(String text, {Color? color}) {
    return Text(text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: color ?? AppColors.textColorDark,
        ));
  }

  static Text termsAndConditionTextText(String text, {Color? color}) {
    return Text(text,
        style: GoogleFonts.poppins(
          fontSize: 10,
          color: color ?? AppColors.textColorDark,
        ));
  }

  static Text homeServicesListText(String text, {Color? color}) {
    return Text(text,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: color ?? AppColors.greyColor,
        ));
  }
}
