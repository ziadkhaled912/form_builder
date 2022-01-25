import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/shared/styles/app_colors.dart';
import 'package:untitled/shared/styles/font_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double radius;
  final double padding;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final bool hasBorder;

  const CustomButton({
    Key? key,
    this.onPressed,
    this.text = 'write text',
    this.textColor = Colors.white,
    this.backgroundColor = AppColors.textButtonColor,
    this.borderColor = AppColors.textButtonColor,
    this.radius = 10.0,
    this.padding = 5.0,
    this.width = double.infinity,
    this.height = 50,
    this.textStyle,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: MaterialButton(
        color: backgroundColor,
        padding: EdgeInsets.all(padding),
        onPressed: onPressed,
        elevation: 0,
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(
          side: hasBorder
              ? BorderSide(width: 1.5, color: onPressed != null ? borderColor : Colors.grey)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Text(
          text,
          style: textStyle ?? thirdTextStyle().copyWith(color: textColor),
        ),
      ),
    );
  }
}