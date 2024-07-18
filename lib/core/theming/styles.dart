import 'package:fast_food/core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class styles {
  static TextStyle item36BoldBlack = GoogleFonts.itim(
    fontSize: 30, // Set the desired font size
    color: Colors.black,
  );
  static TextStyle irishGrover40boldBlack =
      GoogleFonts.irishGrover(fontSize: 30.h, color: Colors.black);

  static TextStyle BlackregularBlack32 =
      TextStyle(color: Colors.black, fontSize: 32.h, fontWeight: FontWeight.w700);

  static TextStyle BlackInter28Black =
  TextStyle(
    fontStyle: FontStyle.italic,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 24.h,
  );
  static TextStyle BlackInter20Black = TextStyle(
    fontStyle: FontStyle.italic,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static TextStyle mainorange30italic = TextStyle(
                        fontSize: 30,
                        color: colorManager.mainorange,
                        fontStyle: FontStyle.italic
  );
}
