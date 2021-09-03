import 'package:fb_clone/models/user.dart';
import 'package:fb_clone/uteis/theme.dart';
import 'package:fb_clone/widgets/button_image_profile.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class OptionList extends StatelessWidget {
  final User user;
  final List<List> _options = const [
    [LineIcons.userFriends, ThemeColors.facebookBlue, "Friends"],
    [LineIcons.facebookMessenger, ThemeColors.facebookBlue, "Messages"],
    [LineIcons.flag, Colors.orange, "Pages"],
    [LineIcons.users, ThemeColors.facebookBlue, 'Groups'],
    [Icons.storefront_outlined, ThemeColors.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Colors.red, 'Watch'],
    [LineIcons.calendar, Colors.deepPurple, 'Events'],
    [LineIcons.chevronCircleDown, Colors.black45, 'See more']
  ];

  OptionList({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount: 1 + _options.length,
          itemBuilder: (context, index) {
            List item = _options[index - 1];

            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: ButtonImageProfile(
                  onTap: () {},
                  user: user,
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Option(
                  icon: item[0], color: item[1], label: item[2], onTap: () {}),
            );
          }),
    );
  }
}

class Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  Option(
      {required this.icon,
      required this.color,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, color: color, size: 35),
          SizedBox(
            width: 4,
          ),
          Flexible(
            child: Text(
              label,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
