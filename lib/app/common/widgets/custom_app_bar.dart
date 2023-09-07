import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });
  final Widget title;
  final Widget? leading;
  final List<Widget>? actions;
  @override
  Size get preferredSize => Size.fromHeight(
        AppBar().preferredSize.height,
      );
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: AppBar(
        leading: leading,
        centerTitle: true,
        title: title,
        actions: actions,
      ),
    );
  }
}
