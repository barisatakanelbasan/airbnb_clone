import 'dart:ui';
import 'package:airbnb_clone/core/extensions/context_extension.dart';
import 'package:airbnb_clone/product/constants/product_constants.dart';
import 'package:airbnb_clone/product/widgets/common_widgets/shimmer_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../generation/assets.gen.dart';
import '../../generation/colors.gen.dart';

class SearchBarWidget extends StatefulWidget {
  final VoidCallback onTap;
  const SearchBarWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  var searchButtonTextcolor = ColorName.black;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(vertical: context.lowValue),
      width: double.infinity,
      height: context.width * .13,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        color: ColorName.white,
        boxShadow: ProductConstants().defaultShadow,
      ),
      child: Row(
        children: [
          // Search Icon

          ElevatedButton(
            clipBehavior: Clip.none,
            style: ButtonStyle(
              shape: MaterialStateProperty.all<CircleBorder>(
                const CircleBorder(),
              ),
            ),
            onPressed: widget.onTap,
            child: Assets.svg.icSearch.svg(
              height: 18,
              color: ColorName.black,
            ),
          ),

          // Where to ?
          ShimmerWidget(
            enabled: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.search_bar_where_to.tr()),
                Text(
                  '${LocaleKeys.search_bar_anywhere.tr()} • ${LocaleKeys.search_bar_anyweek.tr()} • ${LocaleKeys.search_bar_addguests.tr()}',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const Spacer(),

          // Filter Button
          Visibility(
            visible: true, // TODO Make visible false during loading state
            child: ElevatedButton(
              clipBehavior: Clip.none,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<CircleBorder>(
                  const CircleBorder(),
                ),
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    color: ColorName.black.withOpacity(.1),
                  ),
                ),
              ),
              onPressed: widget.onTap,
              child: Assets.svg.icFilter.svg(
                height: 18,
                color: ColorName.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
