import 'package:flutter/material.dart';

import '../common/config.dart';
import '../common/emums.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer();

  Widget _leadingIcon(String src) {
    return Container(
      width: 64.0,
      height: 64.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: new NetworkImage(src),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
            accountName: Text(
              currentUser.name ?? "",
              style: TextStyle(
                  fontSize: 18.0,
                  height: 1.2,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            accountEmail: Text(
              currentUser.email ?? "",
              style: TextStyle(decorationStyle: TextDecorationStyle.dashed),
            ),
            currentAccountPicture: _leadingIcon(currentUser.avatarUrl)),

        ListTile(
          leading: Icon(Icons.camera),
          title: Text(
            "主页",
            style: TextStyle(fontSize: 18.0),
          ),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(Pages.Activity.toString());
          },
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text(
            "个人",
            style: TextStyle(fontSize: 18.0),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Pages.Profile.toString(),
                arguments: currentUser.login);
          },
        ),
        ListTile(
          leading: Icon(Icons.live_help),
          title: Text(
            "问题",
            style: TextStyle(fontSize: 18.0),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Pages.Issue.toString());
          },
        ),
        ListTile(
          leading: Icon(Icons.import_contacts),
          title: Text(
            "Gist",
            style: TextStyle(fontSize: 18.0),
          ),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(Pages.MineGist.toString());
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.book),
          title: Text("我的仓库"),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(Pages.MineRepo.toString());
          },
        ),
        // Divider(),
        // ListTile(
        //   leading: Icon(Icons.apps),
        //   title: Text("精选主题"),
        //   onTap: () {
        //     Navigator.of(context).pushReplacementNamed(Pages.Topic.toString());
        //   },
        // ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("设置"),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(Pages.Setting.toString());
          },
        ),
      ],
    ));
  }
}
