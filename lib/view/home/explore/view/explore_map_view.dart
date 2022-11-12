import 'package:airbnb_clone/core/extensions/context_extension.dart';
import 'package:airbnb_clone/product/constants/product_constants.dart';
import 'package:airbnb_clone/product/generation/assets.gen.dart';
import 'package:airbnb_clone/product/generation/colors.gen.dart';
import 'package:airbnb_clone/product/widgets/common_widgets/filter_bar_widget.dart';
import 'package:airbnb_clone/product/widgets/common_widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../../home_page_view.dart';
import 'explore_list_view.dart';

class ExploreMapView extends StatefulWidget {
  const ExploreMapView({Key? key}) : super(key: key);

  @override
  State<ExploreMapView> createState() => _ExploreMapViewState();
}

class _ExploreMapViewState extends State<ExploreMapView> {
  @override
  Widget build(BuildContext context) {
    var draggableHeight = context.height - (context.paddingTop + 114 + MediaQueryData.fromWindow(ui.window).padding.bottom);
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    // MAP
                    _map(context, draggableHeight),

                    // CURRENT LOCATION BUTTON
                    _currentLocationButton(context)
                  ],
                ),
              ),

              // DRAGGABLE EXPLORE LIST
              _draggableSheet(draggableHeight),
            ],
          ),

          // APPBAR
          _appBar(context),
        ],
      ),
    );
  }

  Container _appBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: context.paddingTop),
      width: double.infinity,
      height: context.paddingTop + 128,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.mediumValue),
            child: SearchBarWidget(onTap: () {}),
          ),

          // Filter Bar
          const Expanded(
            child: FilterBarWidget(),
          ),
        ],
      ),
    );
  }

  Container _map(BuildContext context, double draggableHeight) {
    return Container(
      color: ColorName.red,
      margin: EdgeInsets.only(top: (context.paddingTop + (58))),
      padding: EdgeInsets.only(top: 70, bottom: draggableHeight * .06),
      width: double.infinity,
      child: Container(color: ColorName.green, child: Center(child: Text('Map'))),
    );
  }

  Align _currentLocationButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: const EdgeInsets.all(11),
        margin: EdgeInsets.only(right: context.normalValue, bottom: context.highValue * 1.1),
        height: 40,
        width: 40,
        decoration: BoxDecoration(color: ColorName.white, borderRadius: BorderRadius.circular(8), boxShadow: ProductConstants.instance.defaultShadow),
        child: Assets.svg.icLocation.svg(),
      ),
    );
  }

  Align _draggableSheet(double draggableHeight) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: draggableHeight,
        child: DraggableScrollableSheet(
          controller: draggableScrollController,
          snap: true,
          initialChildSize: 1,
          minChildSize: .12,
          maxChildSize: 1,
          builder: (context, scrollController) {
            return ExploreListView(controller: scrollController);
          },
        ),
      ),
    );
  }
}
