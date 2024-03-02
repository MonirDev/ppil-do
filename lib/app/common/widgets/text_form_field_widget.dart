import 'package:flutter/material.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final IconData? suffixDone;
  final IconData? suffixClose;
  final IconData? suffixEye;
  final Widget? suffixIcon;
  final bool? isValid;
  final bool? isPassField;
  final bool? isPassSecure;
  final bool? enabled;
  final bool? readOnly;
  final bool? isSuffixWidget;
  final String? validateText;
  final String? label;
  final double? contentpaddingLeft;
  final double? borderRadius;
  final String hintText;
  final Function(String)? onchanged;
  final Function()? suffixClick;
  final void Function()? ontap;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.inputType,
    this.inputAction,
    this.suffixDone,
    this.suffixClose,
    this.suffixEye,
    this.isValid,
    this.isPassField,
    this.isPassSecure,
    this.validateText,
    this.suffixClick,
    required this.onchanged,
    this.label,
    this.enabled,
    required this.hintText,
    this.suffixIcon,
    this.ontap,
    this.contentpaddingLeft,
    this.readOnly,
    this.borderRadius,
    this.isSuffixWidget,
    this.focusNode,
  });
  static const InputBorder transparentBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.transparent,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFB4B4B4),
              offset: Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 0,
            ),
          ],
          border: Border.all(
              color: isValid == false && controller!.text != ''
                  ? AppColors.red
                  : AppColors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20))),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        textInputAction: inputAction,
        focusNode: focusNode,
        maxLines: 1,
        enabled: enabled ?? true,
        readOnly: readOnly ?? false,
        style: AppTextStyle.nb16,
        cursorColor: AppColors.black,
        obscureText: isPassSecure ?? false,
        onTap: ontap,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyle.nw14.copyWith(color: AppColors.grey),
            suffixIcon: isSuffixWidget == true
                ? suffixIcon
                : GestureDetector(
                    onTap: suffixClick ?? () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: isValid == true &&
                              controller!.text != '' &&
                              isPassField == false
                          ? Icon(
                              suffixDone,
                              color: AppColors.green,
                            )
                          : isValid == false &&
                                  controller!.text != '' &&
                                  isPassField == false
                              ? Icon(
                                  suffixClose,
                                  color: AppColors.red,
                                )
                              : isPassField == true
                                  ? Icon(
                                      suffixEye,
                                      color: AppColors.grey,
                                    )
                                  : null,
                    ),
                  ),
            label: label == null
                ? null
                : Text(
                    label!,
                    style: AppTextStyle.nw16.copyWith(
                        color: isValid == false && controller!.text != ''
                            ? AppColors.red
                            : AppColors.black.withOpacity(0.8)),
                  ),
            border: transparentBorder,
            focusedBorder: transparentBorder,
            errorBorder: transparentBorder,
            focusedErrorBorder: transparentBorder,
            disabledBorder: transparentBorder,
            enabledBorder: transparentBorder,
            contentPadding:
                EdgeInsets.only(left: contentpaddingLeft ?? 30, right: 10)),
        onChanged: onchanged,
      ),
    );
  }
}
