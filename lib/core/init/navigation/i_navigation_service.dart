abstract class INavigationService {
  Future<void> navigateToPage({String? path, Object? data});
  Future<void> navigateAndClear({String? path, Object? data});
}
