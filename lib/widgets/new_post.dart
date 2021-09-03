import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class NewPost extends StatelessWidget {
  final User user;

  NewPost({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                backgroundImage: CachedNetworkImageProvider(user.urlImage),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: 'What do you think?'),
                ),
              )
            ],
          ),
          Divider(
            height: 10,
            thickness: 0.5,
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Live',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                VerticalDivider(
                  width: 8,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text(
                    'Photo',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                VerticalDivider(
                  width: 8,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.purple,
                  ),
                  label: Text(
                    'Video Call',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
