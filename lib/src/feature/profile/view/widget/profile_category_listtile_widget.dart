import 'package:flutter/material.dart';

class ProfileCategoryListtileWidget extends StatefulWidget {
  final Icon leading;
  final Color splashColor;
  final void Function()? onTap;
  final Widget title;
  Widget? subtitle;
  final Icon trailing;
  ProfileCategoryListtileWidget({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    required this.trailing,
    this.onTap,
    required this.splashColor,
  });

  @override
  State<ProfileCategoryListtileWidget> createState() =>
      _ProfileCategoryListtileWidgetState();
}

class _ProfileCategoryListtileWidgetState
    extends State<ProfileCategoryListtileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: widget.splashColor,
      leading: widget.leading,
      title: widget.title,
      subtitle: widget.subtitle,
      trailing: widget.trailing,
      onTap: widget.onTap,
    );
  }
}
