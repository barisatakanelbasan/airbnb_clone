import 'package:airbnb_clone/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'core/init/navigation/navigation_route.dart';

void main() async {
  await _init();
  runApp(const MyApp());
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
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
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
