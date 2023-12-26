import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/home/widgets/radio_image.dart';
import '../pages/radio/radio_page.dart';
part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(page: HomeRoute.page, initial: true, transitionsBuilder: TransitionsBuilders.slideBottom),
        CustomRoute(page: RadioRoute.page, transitionsBuilder: TransitionsBuilders.slideBottom)
      ];
}
