import 'package:airbnb_clone/core/extensions/context_extension.dart';
import 'package:airbnb_clone/product/constants/product_constants.dart';
import 'package:airbnb_clone/product/generation/assets.gen.dart';
import 'package:airbnb_clone/product/generation/colors.gen.dart';
import 'package:airbnb_clone/product/widgets/common_widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../list/explore_list_view.dart';

class ExploreMapView extends StatefulWidget {
  const ExploreMapView({Key? key}) : super(key: key);

  @override
  State<ExploreMapView> createState() => _ExploreMapViewState();
}

class _ExploreMapViewState extends State<ExploreMapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: (context.paddingTop + (context.highValue * 1.5)) - context.mediumValue * 2),
                      padding: EdgeInsets.only(top: context.mediumValue * 2),
                      width: double.infinity,
                      child: Center(child: Text('Map')),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: context.paddingLow,
                        margin: EdgeInsets.only(right: context.normalValue, bottom: context.highValue * 1.1),
                        height: context.normalValue * 2,
                        width: context.normalValue * 2,
                        decoration: BoxDecoration(color: ColorName.white, borderRadius: BorderRadius.circular(8), boxShadow: ProductConstants().defaultShadow),
                        child: Assets.svg.icLocation.svg(),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: context.height - (context.paddingTop + (context.highValue * 1.5) + MediaQueryData.fromWindow(ui.window).padding.bottom),
                  child: DraggableScrollableSheet(
                    snap: true,
                    initialChildSize: .12,
                    minChildSize: .12,
                    maxChildSize: 1,
                    builder: (context, scrollController) {
                      return ExploreListView(controller: scrollController);
                    },
                  ),
                ),
              ),
            ],
          ),

          // Appbar
          Container(
            padding: EdgeInsets.fromLTRB(context.mediumValue, context.paddingTop, context.mediumValue, context.mediumValue),
            width: double.infinity,
            height: context.paddingTop + context.highValue * 1.5,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: ColorName.black.withOpacity(.1),
                  offset: const Offset(0, 1),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              children: [
                // Search Bar
                SearchBarWidget(onTap: () {}),

                // Filter Bar
                //TODO filter bar
              ],
            ),
          ),
        ],
      ),
    );
  }
}
