import 'package:flutter/material.dart';
import 'package:ppildo/app/utils/assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = AppBar().preferredSize.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8, left: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular((height - 16) / 2)),
        child: Image.asset(
          Assets.images.appLogo,
          height: height,
          width: height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
