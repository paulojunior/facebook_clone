import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_clone/uteis/theme.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String urlImage;
  final bool viwed;

  ProfileImage({required this.urlImage, this.viwed = false});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: ThemeColors.facebookBlue,
      child: CircleAvatar(
        radius: viwed ? 22 : 18,
        backgroundImage: CachedNetworkImageProvider(urlImage),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
