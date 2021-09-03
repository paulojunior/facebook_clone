import 'package:cached_network_image/cached_network_image.dart';
import 'package:fb_clone/data/dummy_data.dart';
import 'package:fb_clone/uteis/theme.dart';
import 'package:fb_clone/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:fb_clone/models/models.dart';

class StoryWidget extends StatelessWidget {
  final User user;
  final List<Story> stories;

  StoryWidget({required this.user, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (context, index) {
            late Story story;

            if (index == 0) {
              story = Story(user: myUser, urlImage: myUser.urlImage);
            } else {
              story = stories[index - 1];
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: StoryCard(
                story: story,
                addStory: index == 0 ? true : false,
              ),
            );
          }),
    );
  }
}

class StoryCard extends StatelessWidget {
  final Story story;
  final bool addStory;

  StoryCard({required this.story, this.addStory = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImage,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: ThemeColors.gradientStory,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: addStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    iconSize: 30,
                    color: ThemeColors.facebookBlue,
                  ),
                )
              : ProfileImage(
                  urlImage: story.user.urlImage,
                  viwed: story.viewed,
                ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            addStory ? "Create Story" : story.user.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
