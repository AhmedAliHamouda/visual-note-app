import 'package:flutter/material.dart';
import 'package:visual_notes/Utils/colors_utils.dart';

class CustomRoundedButton extends StatelessWidget {
  final String? text;
  final VoidCallback? pressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Icon? icon;
  final double? width;
  final double? height;
  final bool? isIconLeft;
  final double? fontSize;
  final double raduis;
  CustomRoundedButton(
      {this.pressed,
      this.text,
      this.backgroundColor,
      this.borderColor,
      this.icon,
      this.textColor,
      this.width,
      this.isIconLeft = false,
      this.height,
      this.fontSize,
      this.raduis = 12});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed ?? () {},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorsUtils.kButtonPrimaryColor,
          borderRadius: BorderRadius.circular(raduis),
          border: Border.all(
            color: borderColor ?? ColorsUtils.transparentColor,
          ),
        ),
        child: isIconLeft!
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (icon == null) ? Container() : icon!,
                  (icon == null) ? Container() : SizedBox(width: 10),
                  Text(
                    text!,
                    style: TextStyle(color: textColor, fontWeight: FontWeight.w800, fontSize: 15),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text!,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: fontSize ?? 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  (icon == null) ? Container() : SizedBox(width: 10),
                  (icon == null) ? Container() : icon!
                ],
              ),
      ),
    );
  }
}
