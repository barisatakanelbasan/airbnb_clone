import 'package:flutter/material.dart';
import '../../../view/home/explore/list/explore_list_view.dart';
import '../../../view/home/explore/map/explore_map_view.dart';
import '../../../view/home/home_page_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const HomePageView(), NavigationConstants.DEFAULT);
      case NavigationConstants.EXPLORE_LIST:
        return normalNavigate(const ExploreListView(), NavigationConstants.EXPLORE_LIST);
      case NavigationConstants.EXPLORE_MAP:
        return normalNavigate(const ExploreMapView(), NavigationConstants.EXPLORE_MAP);
      default:
        return normalNavigate(const HomePageView(), NavigationConstants.DEFAULT);
    }
  }

  // Example Arg Pass
  // case NavigationConstants.SETTINGS_WEB_VIEW:
  //       if (args.arguments is SettingsDynamicModel) {
  //         return normalNavigate(
  //           SettingsDynamicView(model: args.arguments as SettingsDynamicModel),
  //           NavigationConstants.SETTINGS_WEB_VIEW,
  //         );
  //       }
  //       throw NavigateException<SettingsDynamicModel>(args.arguments);

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }
}
