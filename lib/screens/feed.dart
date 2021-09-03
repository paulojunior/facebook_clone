import 'package:fb_clone/data/dummy_data.dart';
import 'package:fb_clone/uteis/responsive.dart';
import 'package:fb_clone/widgets/navigation_bar.dart';
import 'package:fb_clone/widgets/navigation_bar_desktop.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'home_screen.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final List<Widget> _telas = [
    Home(),
    Scaffold(backgroundColor: Colors.green),
    Scaffold(backgroundColor: Colors.blue),
    Scaffold(backgroundColor: Colors.red),
    Scaffold(backgroundColor: Colors.amber),
    Scaffold(backgroundColor: Colors.black87),
    Scaffold(backgroundColor: Colors.grey),
  ];

  List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];

  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: isDesktop
            ? PreferredSize(
                child: NavigationBarDesktop(
                  user: myUser,
                  icons: _icons,
                  selectedIndex: _selectedTab,
                  onTap: (index) {
                    setState(() {
                      _selectedTab = index;
                    });
                  },
                ),
                preferredSize: Size(size.width, 100),
              )
            : null,
        body: TabBarView(
          children: _telas,
        ),
        bottomNavigationBar: isDesktop
            ? null
            : NavigationBar(
                icons: _icons,
                selectedIndex: _selectedTab,
                onTap: (index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
              ),
      ),
    );
  }
}
