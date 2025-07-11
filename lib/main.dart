import 'package:ekotrack/screens/calculator.dart';
import 'package:ekotrack/screens/home_navigator.dart';
import 'package:ekotrack/service/shared_preferences_service.dart';
import 'package:ekotrack/theme/constants/colors.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferenceService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: kDarkGreen,
        useMaterial3: true,
        sliderTheme: const SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
        ),
      ),
      home: Navigator(
        key: navigatorKey,
        initialRoute: "/",
        onGenerateRoute: (settings) {
          if (settings.name == "h") {
            return MaterialPageRoute(
              builder: (_) => const HomeNavigator(),
            );
          }
          return MaterialPageRoute(
            builder: (_) => SharedPreferenceService.firstTimeOpeningApp
                ? const Calculator()
                : const HomeNavigator(),
          );
        },
      ),
    );
  }
}
