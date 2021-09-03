import 'package:fb_clone/models/user.dart';
import 'package:fb_clone/widgets/profile_image.dart';
import 'package:flutter/material.dart';

class ButtonImageProfile extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  ButtonImageProfile({required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ProfileImage(urlImage: user.urlImage),
          SizedBox(
            width: 4,
          ),
          Flexible(
            child: Text(
              user.name,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
