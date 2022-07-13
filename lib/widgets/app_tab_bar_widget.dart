import 'package:flutter/material.dart';

class AppTabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final List<Tab> tabs;
  final TabController controller;
  final EdgeInsets padding;
  final Color unselectedLabelColor;
  final Color labelColor;
  final TextStyle labelStyle;
  final TextStyle? unselectedLabelStyle;
  final Color? indicatorColor;
  final Color? bgColorTab;
  final BoxBorder? border;
  final void Function(int)? onTap;
  final Decoration? indicator;
  final double? height;
  final EdgeInsets? paddingTab;

  const AppTabBarWidget({
    required this.tabs,
    required this.controller,
    required this.padding,
    required this.unselectedLabelColor,
    required this.labelStyle,
    required this.labelColor,
    this.unselectedLabelStyle,
    this.indicatorColor,
    this.bgColorTab,
    this.border,
    this.onTap,
    this.indicator,
    this.height,
    this.paddingTab,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: bgColorTab,
          border: border,
        ),
        child: SizedBox(
          height: height ?? 28,
          child: TabBar(
            padding: paddingTab,
            labelPadding: EdgeInsets.zero,
            unselectedLabelColor: unselectedLabelColor,
            indicator: indicator ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: indicatorColor,
                ),
            labelStyle: labelStyle,
            labelColor: labelColor,
            unselectedLabelStyle: unselectedLabelStyle,
            tabs: tabs,
            controller: controller,
            onTap: onTap,
          ),
        ),
      ),
    );
  }

  //THIS PREFERREDSIZE DOESNT AFFECT ANYTHING
  @override
  Size get preferredSize => const Size.fromHeight(0);
}
