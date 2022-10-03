import 'package:airbnb_clone/core/extensions/context_extension.dart';
import 'package:airbnb_clone/product/generation/assets.gen.dart';
import 'package:airbnb_clone/product/generation/colors.gen.dart';
import 'package:airbnb_clone/product/widgets/advert_widgets/advert_card_widget.dart';
import 'package:airbnb_clone/product/widgets/common_widgets/shimmer_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: Padding(
        padding: context.explorePagePadding,
        child: Column(
          children: const [
            ShimmerWidget(
              enabled: false,
              child: AdvertCardWidget(),
            ),
          ],
        ),
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
            height: 29,
            color: currentIndex == 0 ? ColorName.red : ColorName.grey,
          ),
          label: LocaleKeys.bottom_bar_buttons_explore.tr(),
        ),
        BottomNavigationBarItem(
          icon: Assets.svg.icFav.svg(
            color: currentIndex == 1 ? ColorName.red : ColorName.grey,
            height: 25,
          ),
          label: LocaleKeys.bottom_bar_buttons_wishlists.tr(),
        ),
        BottomNavigationBarItem(
          icon: Assets.svg.icAirbnb.svg(
            color: currentIndex == 2 ? ColorName.red : ColorName.grey,
            height: 25,
          ),
          label: LocaleKeys.bottom_bar_buttons_trips.tr(),
        ),
        BottomNavigationBarItem(
          icon: Assets.svg.icInbox.svg(
            color: currentIndex == 3 ? ColorName.red : ColorName.grey,
            height: 20,
          ),
          label: LocaleKeys.bottom_bar_buttons_inbox.tr(),
        ),
        BottomNavigationBarItem(
          icon: Assets.svg.icProfile.svg(
            color: currentIndex == 4 ? ColorName.red : ColorName.grey,
            height: 23,
          ),
          label: LocaleKeys.bottom_bar_buttons_profile.tr(),
        ),
      ],
    );
  }
}
