import 'package:flutter/material.dart';

import '../common/config.dart';
import '../common/emums.dart';
import './tabbar/activity.dart';
import './tabbar/bookmark.dart';
import './tabbar/notification.dart';
import './tabbar/search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _myPage;
  var selectedPage;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 0);
    selectedPage = 0;
  }

  // navTo(Pages page) {
  //
  //   Navigator.pop(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      drawer: MainDrawer,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _myPage,
        children: <Widget>[
          ActivityPage(),
          SearchPage(),
          NotificationPage(),
          BookmarkPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('活动')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('搜索')),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), title: Text('通知')),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), title: Text('书签')),
        ],
        currentIndex: selectedPage,
        fixedColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
          _myPage.jumpToPage(index);
        },
      ),
    );
  }
}
