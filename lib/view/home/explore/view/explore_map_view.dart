import 'dart:async';

import 'package:airbnb_clone/core/extensions/context_extension.dart';
import 'package:airbnb_clone/product/constants/product_constants.dart';
import 'package:airbnb_clone/product/generation/assets.gen.dart';
import 'package:airbnb_clone/product/generation/colors.gen.dart';
import 'package:airbnb_clone/product/widgets/common_widgets/filter_bar_widget.dart';
import 'package:airbnb_clone/product/widgets/common_widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import '../../home_page_view.dart';
import 'explore_list_view.dart';

class ExploreMapView extends StatefulWidget {
  const ExploreMapView({Key? key}) : super(key: key);

  @override
  State<ExploreMapView> createState() => _ExploreMapViewState();
}

class _ExploreMapViewState extends State<ExploreMapView> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

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
      child: GoogleMap(
        padding: EdgeInsets.only(bottom: draggableHeight * .07, left: 10),
        myLocationButtonEnabled: false,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Align _currentLocationButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 81,
        decoration: BoxDecoration(
          boxShadow: ProductConstants.instance.defaultShadow,
        ),
        margin: EdgeInsets.only(right: context.normalValue * 1.2, top: context.highValue * 2.15),
        child: Column(
          children: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(11),
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                ),
                child: Assets.svg.icLocation.svg(),
              ),
            ),
            Container(
              width: 40,
              height: 1,
              color: ColorName.lightGrey,
            ),
            Container(
              padding: const EdgeInsets.all(9),
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
              ),
              child: Assets.svg.icSettings.svg(color: ColorName.black),
            ),
          ],
        ),
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
