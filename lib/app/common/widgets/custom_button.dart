import 'package:flutter/material.dart';
import 'package:ppildo/app/utils/app_colors.dart';
import 'package:ppildo/app/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.bgColor,
    required this.onPressed,
    required this.label,
    this.borderRadius,
    this.paddingHorizontal,
    this.textSize,
  });
  final Color? bgColor;
  final void Function() onPressed;
  final String label;
  final double? borderRadius;
  final double? paddingHorizontal;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
              horizontal: paddingHorizontal ?? 10,
              vertical: paddingHorizontal != null ? 0 : 10),
        ),
        backgroundColor:
            MaterialStatePropertyAll<Color>(bgColor ?? AppColors.red),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 25),
            ),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          label,
          style: AppTextStyle.bw14.copyWith(fontSize: textSize ?? 14),
        ),
      ),
    );
  }
}
