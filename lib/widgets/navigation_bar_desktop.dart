import 'package:fb_clone/models/user.dart';
import 'package:fb_clone/uteis/theme.dart';
import 'package:fb_clone/widgets/button_image_profile.dart';
import 'package:fb_clone/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'circle_button.dart';

class NavigationBarDesktop extends StatelessWidget {
  final User user;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  NavigationBarDesktop({
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Facebook',
                style: TextStyle(
                  color: ThemeColors.facebookBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  letterSpacing: -1.2,
                ),
              ),
            ),
          ),
          Expanded(
            child: NavigationBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              bottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ButtonImageProfile(
                  user: user,
                  onTap: () {},
                ),
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30,
                  onPressed: () {},
                ),
                CircleButton(
                  icon: LineIcons.facebookMessenger,
                  iconSize: 30,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
