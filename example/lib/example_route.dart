// GENERATED CODE - DO NOT MODIFY MANUALLY
// **************************************************************************
// Auto generated by https://github.com/fluttercandies/ff_annotation_route
// **************************************************************************

import 'package:flutter/widgets.dart';

import 'pages/complex/pull_to_refresh_candies.dart';
import 'pages/complex/pull_to_refresh_chat.dart';
import 'pages/complex/pull_to_refresh_header.dart';
import 'pages/main_page.dart';
import 'pages/simple/pull_to_refresh_appbar.dart';
import 'pages/simple/pull_to_refresh_image.dart';

// ignore_for_file: argument_type_not_assignable
RouteResult getRouteResult({String name, Map<String, dynamic> arguments}) {
  switch (name) {
    case 'fluttercandies://PullToRefreshAppbar':
      return RouteResult(
        name: name,
        widget: PullToRefreshAppbar(),
        routeName: 'PullToRefreshAppbar',
        description:
            'Show how to use pull to refresh notification to build a pull refresh appbar',
        exts: <String, dynamic>{'group': 'Simple', 'order': 0},
      );
    case 'fluttercandies://PullToRefreshCandies':
      return RouteResult(
        name: name,
        widget: PullToRefreshCandies(),
        routeName: 'PullToRefreshCandies',
        description:
            'Show how to use pull to refresh notification to build a pull candies animation',
        exts: <String, dynamic>{'group': 'Complex', 'order': 1},
      );
    case 'fluttercandies://PullToRefreshChat':
      return RouteResult(
        name: name,
        widget: PullToRefreshChat(),
        routeName: 'PullToRefreshChat',
        description:
            'Show how to use pull to refresh notification for reverse list like chat list.',
        exts: <String, dynamic>{'group': 'Complex', 'order': 2},
      );
    case 'fluttercandies://PullToRefreshHeader':
      return RouteResult(
        name: name,
        widget: PullToRefreshHeader(),
        routeName: 'PullToRefreshHeader',
        description:
            'Show how to use pull to refresh notification to build a pull refresh header,and hide it on refresh done',
        exts: <String, dynamic>{'group': 'Complex', 'order': 0},
      );
    case 'fluttercandies://PullToRefreshImage':
      return RouteResult(
        name: name,
        widget: PullToRefreshImage(),
        routeName: 'PullToRefreshImage',
        description:
            'Show how to use pull to refresh notification to build a pull refresh image',
        exts: <String, dynamic>{'group': 'Simple', 'order': 1},
      );
    case 'fluttercandies://demogrouppage':
      return RouteResult(
        name: name,
        widget: DemoGroupPage(
          keyValue: arguments['keyValue'],
        ),
        routeName: 'DemoGroupPage',
      );
    case 'fluttercandies://mainpage':
      return RouteResult(
        name: name,
        widget: MainPage(),
        routeName: 'MainPage',
      );
    default:
      return const RouteResult(name: 'flutterCandies://notfound');
  }
}

class RouteResult {
  const RouteResult({
    @required this.name,
    this.widget,
    this.showStatusBar = true,
    this.routeName = '',
    this.pageRouteType,
    this.description = '',
    this.exts,
  });

  /// The name of the route (e.g., "/settings").
  ///
  /// If null, the route is anonymous.
  final String name;

  /// The Widget return base on route
  final Widget widget;

  /// Whether show this route with status bar.
  final bool showStatusBar;

  /// The route name to track page
  final String routeName;

  /// The type of page route
  final PageRouteType pageRouteType;

  /// The description of route
  final String description;

  /// The extend arguments
  final Map<String, dynamic> exts;
}

enum PageRouteType {
  material,
  cupertino,
  transparent,
}
