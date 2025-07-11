import 'package:ekotrack/models/carbon_footprint.dart';
import 'package:ekotrack/screens/airquality.dart';
import 'package:ekotrack/screens/chat.dart';
import 'package:ekotrack/screens/funfact.dart';
import 'package:ekotrack/screens/homepage.dart';
import 'package:ekotrack/screens/sharing.dart';
import 'package:ekotrack/theme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final GlobalKey<BottomNavBarState> _bottomNavKey = GlobalKey();
final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

final List<String> pages = ["air_quality", "fun_fact", "home", "chat", "map"];

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: "home",
        key: _navigatorKey,
        onGenerateRoute: (settings) {
          pageBuilder(Widget w) {
            try {
              _bottomNavKey.currentState
                  ?.updateIndex(pages.indexOf(settings.name!));
            } on Exception catch (_) {}

            return MaterialPageRoute(builder: (_) => w);
          }

          if (_bottomNavKey.currentState?.index ==
              pages.indexOf(settings.name!)) {
            return null; // TODO: shouldn't do this
          }

          switch (settings.name) {
            case "fun_fact":
              return pageBuilder(const FunFact());
            case "chat":
              return pageBuilder(const Chat());
            case "map":
              return pageBuilder(const Sharing());
            case "air_quality":
              return pageBuilder(AirQuality());
            case "home":
            default:
              if (settings.arguments != null) {
                return pageBuilder(
                  Homepage(
                    carbonFootprint:
                        settings.arguments as CarbonFootprintResult?,
                  ),
                );
              }
              return pageBuilder(const Homepage());
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(
        key: _bottomNavKey,
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int index = 2;

  updateIndex(i) => setState(
        () => index = i,
      );

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey[350],
      selectedItemColor: kDarkGreen,
      showUnselectedLabels: true,
      enableFeedback: true,
      currentIndex: index,
      onTap: (index) =>
          _navigatorKey.currentState?.pushReplacementNamed(pages[index]),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.cloudSunRain),
          label: "Air quality",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.book),
          label: "Challenges",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.house),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.message),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.map),
          label: "Map",
        ),
      ],
    );
  }
}
