import 'package:airbnb_clone/product/generation/assets.gen.dart';
import 'package:airbnb_clone/product/generation/colors.gen.dart';
import 'package:airbnb_clone/product/widgets/animated_widgets/scroll_to_hide_widget.dart';
import 'package:airbnb_clone/view/home/explore/map/explore_map_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/init/lang/locale_keys.g.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

DraggableScrollableController draggableScrollController = DraggableScrollableController();

class _HomePageViewState extends State<HomePageView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentIndex == 0 ? ExploreMapView() : Scaffold(),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  // BOTTOM BAR
  Widget buildBottomBar() {
    return ScrollToHideWidget(
      child: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 11.5,
        iconSize: 25,
        currentIndex: currentIndex,
        selectedItemColor: ColorName.red,
        unselectedIconTheme: const IconThemeData(color: ColorName.grey),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Assets.svg.icSearch.svg(
              height: 25,
              color: currentIndex == 0 ? ColorName.red : ColorName.darkGrey,
            ),
            label: LocaleKeys.bottom_bar_buttons_explore.tr(),
          ),
          BottomNavigationBarItem(
            icon: Assets.svg.icFav.svg(
              color: currentIndex == 1 ? ColorName.red : ColorName.darkGrey,
              height: 25,
            ),
            label: LocaleKeys.bottom_bar_buttons_wishlists.tr(),
          ),
          BottomNavigationBarItem(
            icon: Assets.svg.icAirbnb.svg(
              color: currentIndex == 2 ? ColorName.red : ColorName.darkGrey,
              height: 25,
            ),
            label: LocaleKeys.bottom_bar_buttons_trips.tr(),
          ),
          BottomNavigationBarItem(
            icon: Assets.svg.icInbox.svg(
              color: currentIndex == 3 ? ColorName.red : ColorName.darkGrey,
              height: 25,
            ),
            label: LocaleKeys.bottom_bar_buttons_inbox.tr(),
          ),
          BottomNavigationBarItem(
            icon: Assets.svg.icProfile.svg(
              color: currentIndex == 4 ? ColorName.red : ColorName.darkGrey,
              height: 25,
            ),
            label: LocaleKeys.bottom_bar_buttons_profile.tr(),
          ),
        ],
      ),
    );
  }
}
