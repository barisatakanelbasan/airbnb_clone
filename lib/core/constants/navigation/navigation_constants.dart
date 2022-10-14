// ignore_for_file: constant_identifier_names

import 'package:airbnb_clone/view/home/explore/list/explore_list_view.dart';
import 'package:airbnb_clone/view/home/explore/map/explore_map_view.dart';
import 'package:airbnb_clone/view/home/home_page_view.dart';

class NavigationConstants {
  static const DEFAULT = '/';
  static const EXPLORE_LIST = '/exploreList';
  static const EXPLORE_MAP = '/exploreMap';

  final routes = {
    DEFAULT: (context) => const HomePageView(),
    // EXPLORE_LIST: (context) => const ExploreListView(),
    EXPLORE_MAP: (context) => const ExploreMapView(),
  };
}
