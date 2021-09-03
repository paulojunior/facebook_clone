import 'package:fb_clone/uteis/theme.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool bottomIndicator;

  NavigationBar({
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    this.bottomIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicator: BoxDecoration(
          border: bottomIndicator
              ? Border(
                  bottom: BorderSide(
                    color: ThemeColors.facebookBlue,
                    width: 3,
                  ),
                )
              : Border(
                  top: BorderSide(
                    color: ThemeColors.facebookBlue,
                    width: 3,
                  ),
                )),
      tabs: icons
          .asMap()
          .map((i, e) {
            return MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: selectedIndex == i
                        ? ThemeColors.facebookBlue
                        : Colors.black54,
                    size: 30,
                  ),
                ));
          })
          .values
          .toList(),
    );
  }
}
