import 'package:airbnb_clone/core/extensions/string_extension.dart';
import 'package:airbnb_clone/product/widgets/advert_widgets/advert_card_widget.dart';
import 'package:airbnb_clone/product/widgets/common_widgets/shimmer_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/init/lang/locale_keys.g.dart';

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
      body: Column(
        children: [
          Center(
            child: ShimmerWidget(
              enabled: false,
              child: AdvertCardWidget(),
            ),
          ),
        ],
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
          label: LocaleKeys.bottom_bar_buttons_explore.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'ic_fav'.toSVG,
            color: currentIndex == 1 ? Colors.red : Colors.grey,
            height: 25,
          ),
          label: LocaleKeys.bottom_bar_buttons_wishlists.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'ic_airbnb'.toSVG,
            color: currentIndex == 2 ? Colors.red : Colors.grey,
            height: 25,
          ),
          label: LocaleKeys.bottom_bar_buttons_trips.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'ic_inbox'.toSVG,
            color: currentIndex == 3 ? Colors.red : Colors.grey,
            height: 20,
          ),
          label: LocaleKeys.bottom_bar_buttons_inbox.tr(),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'ic_profile'.toSVG,
            color: currentIndex == 4 ? Colors.red : Colors.grey,
            height: 23,
          ),
          label: LocaleKeys.bottom_bar_buttons_profile.tr(),
        ),
      ],
    );
  }
}
