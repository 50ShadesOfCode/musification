import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final bool? search;
  final bool? centerTitle;
  final double? titleSpacing;
  final Color? backgroundColor;
  final Widget? icon;
  final Text? text;
  final Widget? title;
  final Widget? subtitle;
  final List<Widget>? actions;
  final void Function()? onPressed;
  final double? height;
  final PreferredSizeWidget? bottom;
  final ShapeBorder? shape;

  const AppBarWidget({
    this.backgroundColor,
    bool? automaticallyImplyLeading,
    bool? centerTitle,
    bool? search,
    this.titleSpacing,
    this.icon,
    this.onPressed,
    this.text,
    this.title,
    this.subtitle,
    this.actions,
    this.height,
    this.bottom,
    this.shape,
  })  : automaticallyImplyLeading = automaticallyImplyLeading ?? true,
        centerTitle = centerTitle ?? true,
        search = search ?? false;

  @override
  Widget build(BuildContext context) {
    return search == false
        ? AppBar(
            shape: shape,
            automaticallyImplyLeading: automaticallyImplyLeading,
            backgroundColor: backgroundColor,
            elevation: 0,
            titleSpacing: titleSpacing,
            centerTitle: centerTitle,
            leading: automaticallyImplyLeading != false
                ? IconButton(
                    icon: icon ?? SvgPicture.asset(AppImages.chevronLeft),
                    onPressed: onPressed,
                    color: AppTheme.activeColor)
                : null,
            title: subtitle == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      title!,
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      subtitle!,
                      title!,
                    ],
                  ),
            actions: actions,
            bottom: bottom,
          )
        : AppBar();
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
