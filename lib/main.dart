import 'package:airbnb_clone/core/constants/app/app_constants.dart';
import 'package:airbnb_clone/core/init/lang/language_manager.dart';
import 'package:airbnb_clone/core/init/navigation/navigation_service.dart';
import 'package:airbnb_clone/product/generation/colors.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/init/navigation/navigation_route.dart';
import 'firebase_options.dart';

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
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.pressed) ? ColorName.lightGrey.withOpacity(.2) : ColorName.white),
            backgroundColor: MaterialStateProperty.all<Color>(ColorName.white),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          ),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
    );
  }
}
