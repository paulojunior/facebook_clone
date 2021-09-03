import 'package:fb_clone/data/dummy_data.dart';
import 'package:fb_clone/models/models.dart';
import 'package:fb_clone/uteis/responsive.dart';
import 'package:fb_clone/uteis/theme.dart';
import 'package:fb_clone/widgets/circle_button.dart';
import 'package:fb_clone/widgets/contact_list.dart';
import 'package:fb_clone/widgets/new_post.dart';
import 'package:fb_clone/widgets/option_list.dart';
import 'package:fb_clone/widgets/post_card.dart';
import 'package:fb_clone/widgets/story_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        desktop: HomeDesktop(),
        mobile: HomeMobile(),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: false,
          title: Text(
            'Facebook',
            style: TextStyle(
              color: ThemeColors.facebookBlue,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: -1.2,
            ),
          ),
          actions: [
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
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: StoryWidget(
              user: myUser,
              stories: stories,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: NewPost(
            user: myUser,
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            Post post = posts[index];
            return PostCard(post: post);
          },
          childCount: posts.length,
        ))
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: OptionList(
              user: myUser,
            ),
          ),
          flex: 2,
        ),
        Spacer(),
        Flexible(
          flex: 5,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: NewPost(
                  user: myUser,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: StoryWidget(
                    user: myUser,
                    stories: stories,
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  Post post = posts[index];
                  return PostCard(post: post);
                },
                childCount: posts.length,
              ))
            ],
          ),
        ),
        Spacer(),
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: ContactList(
              users: onlineUsers,
            ),
          ),
          flex: 2,
        ),
      ],
    );
  }
}
