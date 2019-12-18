import 'package:flutter/material.dart';
import '../common/emums.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex;

  BottomBar({@required this.selectedIndex});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // 底部导航
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('活动')),
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('搜索')),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), title: Text('通知')),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), title: Text('书签')),
      ],
      currentIndex: widget.selectedIndex,
      fixedColor: Colors.blue,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.of(context)
                .pushReplacementNamed(Pages.Activity.toString());
            break;
          case 1:
            Navigator.of(context).pushReplacementNamed(Pages.Search.toString());
            break;
          case 2:
            Navigator.of(context)
                .pushReplacementNamed(Pages.Notification.toString());
            break;
          case 3:
            Navigator.of(context)
                .pushReplacementNamed(Pages.Bookmark.toString());
            break;
          default:
        }
      },
    );
  }
}
