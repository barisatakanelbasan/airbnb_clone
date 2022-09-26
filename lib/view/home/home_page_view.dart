import 'package:airbnb_clone/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  // BOTTOM BAR
  BottomNavigationBar buildBottomBar() {
    return BottomNavigationBar(
      selectedFontSize: 12,
      unselectedFontSize: 11.5,
      iconSize: 25,
      currentIndex: currentIndex,
      selectedItemColor: Colors.red,
      unselectedIconTheme: const IconThemeData(color: Colors.grey),
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'ic_search'.toSVG,
            color: currentIndex == 0 ? Colors.red : Colors.grey,
            height: 29,
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'ic_fav'.toSVG,
            color: currentIndex == 1 ? Colors.red : Colors.grey,
            height: 25,
          ),
          label: 'Wishlists',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'ic_airbnb'.toSVG,
            color: currentIndex == 2 ? Colors.red : Colors.grey,
            height: 25,
          ),
          label: 'Trips',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'ic_inbox'.toSVG,
            color: currentIndex == 3 ? Colors.red : Colors.grey,
            height: 20,
          ),
          label: 'Inbox',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'ic_profile'.toSVG,
            color: currentIndex == 4 ? Colors.red : Colors.grey,
            height: 23,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
