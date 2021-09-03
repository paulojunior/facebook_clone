import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_clone/models/models.dart';
import 'package:fb_clone/uteis/theme.dart';
import 'package:fb_clone/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: <Widget>[
                HeaderPost(post: post),
                Text(post.description),
              ],
            ),
          ),

          SizedBox(
            width: 8,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  post.user.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text("${post.timeAgo} - "),
                    Icon(
                      Icons.public,
                      size: 12,
                      color: Colors.grey[600],
                    ),
                  ],
                )
              ],
            ),
          ),

          //Post image
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CachedNetworkImage(
              imageUrl: post.urlImage,
            ),
          ),

          //Statistics
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: StatisticPost(
              post: post,
            ),
          ),
        ],
      ),
    );
  }
}

class StatisticPost extends StatelessWidget {
  final Post post;

  StatisticPost({required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: ThemeColors.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                "${post.likes}",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            Text(
              "${post.comments} comments",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${post.shared} shared",
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        Divider(
          thickness: 1.2,
        ),
        Row(
          children: <Widget>[
            ButtonPost(
              icon: Icon(
                LineIcons.thumbsUpAlt,
                color: Colors.grey[700],
              ),
              label: 'Like',
              onTap: () {},
            ),
            ButtonPost(
              icon: Icon(
                LineIcons.alternateCommentAlt,
                color: Colors.grey[700],
              ),
              label: 'Comment',
              onTap: () {},
            ),
            ButtonPost(
              icon: Icon(
                LineIcons.share,
                color: Colors.grey[700],
              ),
              label: 'Share',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class ButtonPost extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;

  ButtonPost({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            child: Row(
              children: <Widget>[
                icon,
                SizedBox(width: 4),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderPost extends StatelessWidget {
  final Post post;

  HeaderPost({required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProfileImage(urlImage: post.user.urlImage, viwed: true),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
