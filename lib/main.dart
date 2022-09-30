import 'package:airbnb_clone/core/constants/app/app_constants.dart';
import 'package:airbnb_clone/core/init/lang/language_manager.dart';
import 'package:airbnb_clone/core/init/navigation/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/init/navigation/navigation_route.dart';

void main() async {
  await _init();
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANG_ASSET_PATH,
      fallbackLocale: LanguageManager.instance.enLocale,
      child: const MyApp(),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airbnb Clone',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
    );
  }
}
