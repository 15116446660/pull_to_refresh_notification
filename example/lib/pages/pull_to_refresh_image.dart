import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';
import 'package:ff_annotation_route/ff_annotation_route.dart';

@FFRoute(
    name: 'fluttercandies://PullToRefreshImage',
    routeName: 'PullToRefreshImage',
    description:
        'Show how to use pull to refresh notification to build a pull refresh image')
class PullToRefreshImage extends StatefulWidget {
  @override
  _PullToRefreshImageState createState() => _PullToRefreshImageState();
}

class _PullToRefreshImageState extends State<PullToRefreshImage> {
  final GlobalKey<PullToRefreshNotificationState> key =
      GlobalKey<PullToRefreshNotificationState>();
  int listlength = 50;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          PullToRefreshNotification(
            color: Colors.blue,
            pullBackOnRefresh: true,
            onRefresh: onRefresh,
            key: key,
            child: CustomScrollView(
              ///in case list is not full screen and remove ios Bouncing
              physics: const AlwaysScrollableClampingScrollPhysics(),
              slivers: <Widget>[
                const SliverAppBar(
                  title: Text('PullToRefreshImage'),
                ),
                PullToRefreshContainer(buildPulltoRefreshImage),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return Container(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'List item : ${listlength - index}',
                            style: const TextStyle(fontSize: 15.0),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 2.0,
                          )
                        ],
                      ));
                }, childCount: listlength)),
              ],
            ),
          ),
          Positioned(
            right: 20.0,
            bottom: 20.0,
            child: FloatingActionButton(
              child: Icon(Icons.refresh),
              onPressed: () {
                key.currentState.show();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildPulltoRefreshImage(PullToRefreshScrollNotificationInfo info) {
    print(info?.mode);
    print(info?.dragOffset);
//    print('------------');
    final double offset = info?.dragOffset ?? 0.0;
    Widget refreshWiget = Container();
    if (info?.refreshWiget != null) {
      refreshWiget = Material(
        type: MaterialType.circle,
        color: Theme.of(context).canvasColor,
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: info.refreshWiget,
        ),
      );
    }

    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
              height: 200.0 + offset,
              width: double.infinity,
              child: Image.asset(
                'assets/467141054.jpg',
                //fit: offset > 0.0 ? BoxFit.cover : BoxFit.fill,
                fit: BoxFit.cover,
              )),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                refreshWiget,
                Container(
                  padding: const EdgeInsets.only(left: 5.0),
                  alignment: Alignment.center,
                  child: Text(
                    info?.mode?.toString() ?? '',
                    style: const TextStyle(fontSize: 12.0, inherit: false),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool> onRefresh() {
    return Future<bool>.delayed(const Duration(seconds: 2), () {
      setState(() {
        listlength += 10;
      });
      return true;
    });
  }
}
