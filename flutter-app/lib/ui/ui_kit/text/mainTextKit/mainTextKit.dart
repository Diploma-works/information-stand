import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../color/color_kit.dart';
import '../text_kit.dart';

class MainTextKit implements TextKit{

  final ColorKit colors;

  const MainTextKit({required this.colors});

  @override
  get large =>  GoogleFonts.montserrat(
    fontSize: 30,
    color: colors.text,
  );

  @override
  get medium =>  GoogleFonts.montserrat(
    fontSize: 20,
    color: colors.text,
  );

  @override
  get small =>  GoogleFonts.montserrat(
    fontSize: 16,
    color: colors.text,
  );

  @override
  TextStyle get greyCaps => GoogleFonts.montserrat(
    fontSize: 14,
    color: colors.greyText,
  );

  @override
  TextStyle get greySmall => GoogleFonts.montserrat(
    fontSize: 16,
    color: colors.greyText,
  );

  @override
  TextStyle get smallBold => GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: colors.text,
  );


}