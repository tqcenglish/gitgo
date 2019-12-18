import 'package:flutter/widgets.dart';
import 'package:gitgo/page/gist.dart';
import 'package:gitgo/page/gist_detail.dart';
import 'package:gitgo/page/home.dart';

import './emums.dart';
import '../page/code.dart';
import '../page/commit_detail.dart';
import '../page/issue.dart';
import '../page/issue_detail.dart';
import '../page/profile.dart';
import '../page/repo_detail.dart';
import '../page/repository.dart';
import '../page/setting.dart';
import '../page/topic.dart';
import '../page/user.dart';
import 'config.dart';

Map<String, WidgetBuilder> mainRoutes = <String, WidgetBuilder>{
  Pages.Home.toString(): (context) => HomePage(),
  // Pages.Activity.toString(): (context) => ActivityPage(),
  // Pages.Bookmark.toString(): (context) => BookmarkPage(),
  // Pages.Search.toString(): (context) => SearchPage(),
  // Pages.Notification.toString(): (context) => NotificationPage(),

  Pages.Issue.toString(): (context) => IssuePage(),
  Pages.Profile.toString(): (context) => ProfilePage(),
  Pages.MineRepo.toString(): (context) => RepositoryPage(Repos.Mine),
  Pages.UserRepo.toString(): (context) => RepositoryPage(Repos.User),
  Pages.StarredRepo.toString(): (context) => RepositoryPage(Repos.Starred),
  Pages.RepoDetail.toString(): (context) => RepoDetailPage(),
  Pages.CodeView.toString(): (context) => CodeViewPage(),
  Pages.Topic.toString(): (context) => TopicPage(),
  Pages.TopicRepo.toString(): (context) => RepositoryPage(Repos.Topic),
  Pages.Setting.toString(): (context) => SettingPage(),
  Pages.User.toString(): (context) => UserPage(),
  Pages.CommitDetail.toString(): (context) => CommitDetailPage(),
  Pages.IssueDetail.toString(): (context) => IssueDetailPage(),
  Pages.MineGist.toString(): (context) => GistPage(Gists.Mine),
  Pages.UserGist.toString(): (context) => GistPage(Gists.User),
  Pages.GistDetail.toString(): (context) => GistDetailPage(),
};

void routeToFirstPage(BuildContext context) {
  var page = settingModel.firstPage;

  switch (page) {
    case FirstPage.Profile:
      Navigator.of(context).pushReplacementNamed(Pages.Profile.toString(),
          arguments: currentUser.login);
      break;
    case FirstPage.Notification:
      Navigator.of(context).pushReplacementNamed(Pages.Notification.toString());
      break;
    case FirstPage.Issue:
      Navigator.of(context).pushReplacementNamed(Pages.Issue.toString());
      break;
    case FirstPage.MineRepo:
      Navigator.of(context).pushReplacementNamed(Pages.MineRepo.toString());
      break;
    case FirstPage.StarredRepo:
      Navigator.of(context).pushReplacementNamed(Pages.StarredRepo.toString());
      break;
    case FirstPage.Bookmark:
      Navigator.of(context).pushReplacementNamed(Pages.Bookmark.toString());
      break;
    case FirstPage.Topic:
      Navigator.of(context).pushReplacementNamed(Pages.Topic.toString());
      break;
    default:
      Navigator.of(context).pushReplacementNamed(Pages.Home.toString());
  }
}
