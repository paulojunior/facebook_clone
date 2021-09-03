import 'package:fb_clone/models/user.dart';
import 'package:fb_clone/widgets/button_image_profile.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<User> users;

  ContactList({required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Contatos',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.video_call),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: ButtonImageProfile(user: users[index], onTap: () {}),
                );
              }),
        )
      ],
    );
  }
}
