import 'package:flutter/material.dart';
import 'package:github/server.dart';
import '../util/language_color.dart';
import '../common/emums.dart';
import '../util/icon.dart';

class RepoListItem extends StatelessWidget {
  final Repository _repo;

  RepoListItem(this._repo);

  Color _langColor(String lang) {
    var colorStr = languagesColor[lang];
    if (colorStr != null) {
      var r = colorStr.substring(1, 3);
      var g = colorStr.substring(3, 5);
      var b = colorStr.substring(5, 7);
      return Color.fromARGB(255, int.parse(r, radix: 16),
          int.parse(g, radix: 16), int.parse(b, radix: 16));
    }
    return Colors.black;
  }

  Widget _iconText(Widget icon, Text text, double width) {
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: width, maxWidth: width + 30),
        child: Row(
          children: <Widget>[
            icon,
            text,
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: leadingIcon(_repo.owner.avatarUrl),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200),
            child: Text(
              _repo.name,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(_repo.description?.trim() ?? "", softWrap: true),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _iconText(
                      Icon(Icons.language,
                          size: 14, color: _langColor(_repo.language ?? "")),
                      Text(
                        _repo.language ?? "未知",
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(color: _langColor(_repo.language ?? "")),
                      ),
                      80),
                ),
                _iconText(Icon(Icons.star, size: 14),
                    Text(_repo.stargazersCount?.toString() ?? "0"), 30),
                _iconText(
                    Icon(
                      Icons.call_split,
                      size: 14,
                    ),
                    Text(_repo.forksCount?.toString() ?? "0"),
                    30),
              ],
            ),
          )
        ],
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(Pages.RepoDetail.toString(), arguments: _repo.slug());
      },
    ));
  }
}
