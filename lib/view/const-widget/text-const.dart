import 'package:desktopgame/constant/dynamic-size.dart';
import 'package:desktopgame/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextConst extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final double? width;
  final FontStyle? style;
  const TextConst(
      {super.key,
      required this.text,
      this.fontWeight,
      this.fontSize,
      this.textColor,
      this.textAlign,
      this.maxLines,
      this.softWrap,
      this.overflow,
      this.padding,
      this.alignment, this.width, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: alignment ?? Alignment.center,
      padding: padding,
      child: Text(text,
          overflow: overflow,
          softWrap: softWrap,
          textAlign: textAlign,
          style: GoogleFonts.dmSerifText(
            textStyle: TextStyle(
                fontSize:fontSize??Sizes.fontSizeOne,
                fontWeight: fontWeight ?? FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: textColor ?? Colors.black,height: 0.8),
          )),
    );
  }
}
