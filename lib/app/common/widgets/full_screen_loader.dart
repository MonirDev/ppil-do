import 'package:flutter/material.dart';
import 'package:ppildo/app/utils/app_colors.dart';

class FullSCreenLoader extends StatelessWidget {
  const FullSCreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 35,
        width: 35,
        child: CircularProgressIndicator(
          color: AppColors.black,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
