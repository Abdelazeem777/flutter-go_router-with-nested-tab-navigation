import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/src/modules/details/details_page.dart';
import 'package:go_router_example/src/modules/feed/feed_page.dart';
import 'package:go_router_example/src/modules/scaffold_with_navbar/scaffold_with_navbar.dart';
import 'package:go_router_example/src/modules/shop/shop_page.dart';

import '../modules/setting/setting_page.dart';

// Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final statefulShellBranches = [
  StatefulShellBranch(
    navigatorKey: _sectionNavigatorKey,
    // Add this branch routes
    // each routes with its sub routes if available e.g feed/uuid/details
    routes: <RouteBase>[
      GoRoute(
        path: '/feed',
        builder: (context, state) => const FeedPage(),
        routes: <RouteBase>[
          GoRoute(
            path: 'details',
            builder: (context, state) {
              return const DetailsPage(label: 'FeedDetails');
            },
          )
        ],
      ),
    ],
  ),

  // The route branch for 2º Tab
  StatefulShellBranch(routes: <RouteBase>[
    // Add this branch routes
    // each routes with its sub routes if available e.g shope/uuid/details
    GoRoute(
      path: '/shop',
      builder: (context, state) => const ShopPage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (context, state) {
            return const DetailsPage(label: 'ShopeDetails');
          },
        )
      ],
    ),
  ]),
  // The route branch for 3º Tab
  StatefulShellBranch(routes: <RouteBase>[
    // Add this branch routes
    // each routes with its sub routes if available e.g shope/uuid/details
    GoRoute(
      path: '/setting',
      builder: (context, state) => const SettingPage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (context, state) {
            return const DetailsPage(label: 'SettingsDetails');
          },
        )
      ],
    ),
  ])
];

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/feed',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // Return the widget that implements the custom shell (e.g a BottomNavigationBar).
        // The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.
        return ScaffoldWithNavbar(navigationShell);
      },
      branches: statefulShellBranches,
    ),
  ],
);
