import 'package:fluro/fluro.dart';
import 'package:weather/route/rtn_route_handlers.dart';

///
class WeatherAppRoutes {
  ///
  static late FluroRouter router;

  /// root home screen
  static const String root = '/';

  static const String pinnedCityDetails = '/pinned';

  static const String addToPinnedCity = '/add_to_pinned';

  /// configuring routes
  static void configureRoutes(FluroRouter router) {
    router.define(root,
        handler: rootHandler, transitionType: TransitionType.inFromRight);
    router.define(pinnedCityDetails,
        handler: pinnedCityDetailsHandler, transitionType: TransitionType.inFromRight);
    router.define(addToPinnedCity,
        handler: addToPinnedCityHandler, transitionType: TransitionType.inFromRight);


  }
}
