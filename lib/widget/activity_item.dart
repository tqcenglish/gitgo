import 'package:flutter/material.dart';
import 'package:github/server.dart';

class ActivityListItem extends StatelessWidget {

  Event _event;
  ActivityListItem(this._event);
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white, width: 3.0))),
        padding: EdgeInsets.all(2),
        child: ListTile(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(_event?.actor?.avatarUrl ?? "", width: 32, height: 32),
              Text(_event?.actor?.login ?? ""),
              Text(_event?.createdAt?.toLocal().toString() ?? "")
            ],
          ),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(_event?.type ?? ""), Text(_event?.repo?.name ?? "")],
          ),
        ));
  }
}
