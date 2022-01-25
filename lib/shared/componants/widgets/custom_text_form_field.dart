import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/shared/styles/app_colors.dart';
import 'package:untitled/shared/styles/font_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String? hint;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final String? Function(String?) validation;
  final String? labelText;
  final String? titleText;
  final Widget? prefix;
  final Function()? onTap;
  final IconData? suffixIcon;
  final bool isSecure;
  final bool enabled;
  final Function()? suffixPressed;
  final Function(String?)? onSaved;
  final FocusNode? focusNode;
  final bool hasBorder;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsets? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final bool isOptional;
  final bool isRequired;

  const CustomTextFormField({
    Key? key,
    this.controller,
    required this.type,
    this.hint,
    this.onSubmit,
    this.onChange,
    required this.validation,
    this.labelText,
    this.titleText,
    this.prefix,
    this.onTap,
    this.suffixIcon,
    this.isSecure = false,
    this.enabled = true,
    this.suffixPressed,
    this.onSaved,
    this.focusNode,
    this.hasBorder = true,
    this.backgroundColor,
    this.borderRadius = 10,
    this.contentPadding,
    this.inputFormatters,
    this.isOptional = false,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null)
          RichText(
            text: TextSpan(
              text: titleText!,
              style: thirdTextStyle(),
              children: <TextSpan>[
                if (isOptional)
                  TextSpan(text: ' (اختيارى)', style: subTextStyle().copyWith(color: Colors.grey)),
                if(isRequired)
                  TextSpan(text: ' *', style: thirdTextStyle().copyWith(color: AppColors.errorColor)),
              ],
            ),
          ),
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: TextFormField(
            enabled: enabled,
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.center,
            controller: controller,
            keyboardType: type,
            onFieldSubmitted: onSubmit,
            onChanged: onChange,
            onTap: onTap,
            onSaved: onSaved,
            validator: validation,
            obscureText: isSecure,
            style: secondaryTextStyle(),
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              filled: backgroundColor != null ? true : false,
              fillColor: backgroundColor,
              labelText: labelText,
              labelStyle: TextStyle(
                fontSize: 18.sp,
              ),
              hintText: hint,
              contentPadding: contentPadding,
              hintStyle: thirdTextStyle().copyWith(color: Colors.black54),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(suffixIcon),
                      onPressed: suffixPressed ?? () {},
                      splashRadius: 1,
                    )
                  : null,
              prefixIcon: prefix,
              border: hasBorder ? null : InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
