import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visual_notes/Utils/colors_utils.dart';


class AppTextFormField extends StatelessWidget {
  final double? sidePadding;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? fieldHeight;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool autofocus;
  final Color? borderColor;
  final String? errorText;
  final String? hintText;
  final double? borderRadius;
  final int? maxLines;
  final int? minLines;
  final Widget? prefix;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final String? labelText;
  final String? initialValue;

  AppTextFormField({
    this.autofocus = false,
    this.borderColor=ColorsUtils.transparentColor,
    this.controller,
    this.fieldHeight,
    this.errorText,
    this.hintText,
    this.borderRadius=10.0,
    this.isPassword = false,
    this.keyboardType,
    this.prefix,
    this.suffix,
    this.sidePadding,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.horizontalPadding,
    this.verticalPadding,
    this.fillColor,
    this.labelText,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: sidePadding ?? 0,
        right: sidePadding ?? 0,
      ),
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        autofocus: autofocus,
        minLines: minLines ?? 1,
        maxLines: maxLines ?? 1,
        style: GoogleFonts.cairo(color: ColorsUtils.blackColor, fontSize: 15),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          labelStyle: GoogleFonts.aBeeZee(fontSize: 18, color: ColorsUtils.kPrimaryColor,letterSpacing: 3.5,fontWeight: FontWeight.w600),
          fillColor: fillColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 5,
            vertical: verticalPadding ?? 15,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: BorderSide(
                color: borderColor!,
                width: 1,
                style: BorderStyle.solid,
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: BorderSide(
                color: borderColor!,
                width: 1,
                style: BorderStyle.solid,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: BorderSide(
                color: borderColor!,
                width: 1,
                style: BorderStyle.solid,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: BorderSide(
                //color: ColorsUtils.primaryYellow,
                color: borderColor!,
                width: 1,
                style: BorderStyle.solid,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: BorderSide(
                color: borderColor!,
                width: 1,
                style: BorderStyle.solid,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              borderSide: BorderSide(
                color: borderColor!,
                width: 1,
                style: BorderStyle.solid,
              )),
          hintText: hintText,
          hintStyle: GoogleFonts.cairo(fontSize: 14, color: ColorsUtils.greyTextColor),
          errorStyle: GoogleFonts.cairo(color: Colors.red),
          suffixIcon: suffix,
          prefixIcon: prefix,
        ),
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
