import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextFieldConst extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration? decoration = const InputDecoration();
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign = TextAlign.start;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final bool expands = false;
  final int? maxLength;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? icon;
  final Color? iconColor;
  final String? label;
  final bool? filled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final void Function(String)? onChanged;
  final double? height;
  final double? width;
  final double? hintSize;
  final double? fontSize;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final Color? cursorColor;
  final Widget? prefix;
  final Widget? sufix;
  final BorderRadius? fieldRadius;
  final bool? enabled;
  final void Function()? onTap;
  final bool? autofocus;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? margin;
  final Color? hintColor;
  final String? errorText;
  final TextInputAction? textInputAction;
  final BorderSide? borderSide;
  final BorderSide? borderSideFocus;


  TextFieldConst({super.key, this.controller,
    this.style,
    this.strutStyle,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false, // Default value set to false
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.icon,
    this.iconColor,
    this.label,
    this.filled,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.onChanged,
    this.height,
    this.width,
    this.hintSize,
    this.fontSize,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.contentPadding,
    this.cursorHeight,
    this.cursorColor,
    this.prefix,
    this.sufix,
    this.fieldRadius,
    this.enabled,
    this.maxLines,
    this.onTap,
    this.autofocus,
    this.onSaved,
    this.validator,
    this.margin, this.hintColor, this.errorText, this.textInputAction, this.borderSide, this.borderSideFocus, this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:margin,
        height:height,
        width:width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border:border,
          borderRadius:borderRadius,
          boxShadow: boxShadow,
        ),
        child: TextFormField(
          textInputAction: textInputAction??TextInputAction.done,
          validator:validator ,
          onSaved: onSaved,
          autofocus:autofocus??false,
          textAlignVertical: TextAlignVertical.center,
          enabled: enabled,
          controller: controller,
          cursorColor: cursorColor,
          cursorHeight: cursorHeight,
          onChanged: onChanged,
          maxLines: maxLines??null,
          maxLength: maxLength,
          expands: expands,
          readOnly: readOnly,
          obscureText: obscureText??false,
          keyboardType: keyboardType,
          style:style ?? GoogleFonts.dmSerifText(
            textStyle: TextStyle(
                fontSize:fontSize ?? 15,
                fontWeight:FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.black
            ),
          ),
          decoration: InputDecoration(
            errorText: errorText,
            counterText: "",
            prefixIcon:prefix,
            suffixIcon: sufix,
            filled: filled ?? true,
            fillColor: fillColor??Colors.grey.withOpacity(0.1),
            hintText: label,
            hintStyle: GoogleFonts.dmSerifText(
              textStyle: TextStyle(
                  fontSize:hintSize ?? 16,
                  fontWeight:FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  color:hintColor ?? Colors.grey
              ),
            ),
            contentPadding:contentPadding ?? const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
            enabledBorder: OutlineInputBorder(
                borderSide:borderSide??BorderSide.none,
                borderRadius:fieldRadius== null? const BorderRadius.all(Radius.circular(4.0)):fieldRadius!
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: borderSideFocus??BorderSide.none,
                borderRadius:fieldRadius== null? const BorderRadius.all(Radius.circular(4.0)):fieldRadius!
            ),
          ),
        ),
      ),
    );
  }
}
