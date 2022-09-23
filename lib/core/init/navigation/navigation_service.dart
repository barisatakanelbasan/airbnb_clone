import 'package:airbnb_clone/core/init/navigation/i_navigation_service.dart';
import 'package:flutter/material.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> navigateAndClear({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }
}
