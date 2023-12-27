// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    RadioRoute.name: (routeData) {
      final args = routeData.argsAs<RadioRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RadioPage(
          key: args.key,
          url: args.url,
          title: args.title,
          gradientColor: args.gradientColor,
          faviconUrl: args.faviconUrl,
          image: args.image,
        ),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RadioPage]
class RadioRoute extends PageRouteInfo<RadioRouteArgs> {
  RadioRoute({
    Key? key,
    required String url,
    required String title,
    required Color gradientColor,
    required String faviconUrl,
    required ImageProvider<Object> image,
    List<PageRouteInfo>? children,
  }) : super(
          RadioRoute.name,
          args: RadioRouteArgs(
            key: key,
            url: url,
            title: title,
            gradientColor: gradientColor,
            faviconUrl: faviconUrl,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'RadioRoute';

  static const PageInfo<RadioRouteArgs> page = PageInfo<RadioRouteArgs>(name);
}

class RadioRouteArgs {
  const RadioRouteArgs({
    this.key,
    required this.url,
    required this.title,
    required this.gradientColor,
    required this.faviconUrl,
    required this.image,
  });

  final Key? key;

  final String url;

  final String title;

  final Color gradientColor;

  final String faviconUrl;

  final ImageProvider<Object> image;

  @override
  String toString() {
    return 'RadioRouteArgs{key: $key, url: $url, title: $title, gradientColor: $gradientColor, faviconUrl: $faviconUrl, image: $image}';
  }
}
