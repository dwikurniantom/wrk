import 'package:flutter/material.dart';
import '../../presentation/pages/home_page.dart';

class RouteUtil {
  final BuildContext context;

  RouteUtil({
    required this.context,
  });

  /// This global key is used for retrieve current context
  static var navigatorKey = GlobalKey<NavigatorState>();

  /// This is a constant for initial route, it can be main page / splash or even
  /// authentication pages depend on the authentication proccess
  String get initialRoute => HomePage.routeName;

  /// This is map of all routes, every single page that will be used in the
  /// future must be added to this map routes.
  Map<String, Widget Function(BuildContext)> get routes => {
        /// Home page route
        HomePage.routeName: (context) => const HomePage(),
      };

  /// onGenerateRoute is used to register fullscreen dialog, or anything that
  /// needed to be put on the middle of navigation proccess
  MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case CategorySelectorPage.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) => const CategorySelectorPage(),
      //     fullscreenDialog: true,
      //     settings: RouteSettings(
      //       arguments: settings.arguments,
      //     ),
      //   );
      default:
        return null;
    }
  }
}
