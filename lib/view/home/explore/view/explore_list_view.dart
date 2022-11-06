import 'package:airbnb_clone/core/extensions/context_extension.dart';
import 'package:airbnb_clone/product/constants/product_constants.dart';
import 'package:airbnb_clone/product/generation/assets.gen.dart';
import 'package:airbnb_clone/product/widgets/advert_widgets/advert_card_widget.dart';
import 'package:airbnb_clone/view/home/explore/view_model/explore_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/generation/colors.gen.dart';
import 'dart:ui' as ui;
import '../../home_page_view.dart';

class ExploreListView extends StatefulWidget {
  final ScrollController controller;
  const ExploreListView({Key? key, required this.controller}) : super(key: key);

  @override
  State<ExploreListView> createState() => _ExploreListViewState();
}

class _ExploreListViewState extends State<ExploreListView> {
  final _viewModel = ExploreViewModel();
  double mapButtonOpacity = 1.0;
  @override
  void initState() {
    draggableScrollController.addListener(changeMapButtonOpacity);
    super.initState();
  }

  void changeMapButtonOpacity() {
    if (mounted) {
      setState(() {
        if (draggableScrollController.size < 0.121) {
          mapButtonOpacity = 0.0;
        } else {
          mapButtonOpacity = draggableScrollController.size;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var draggableHeight = context.height - (context.paddingTop + 114 + MediaQueryData.fromWindow(ui.window).padding.bottom);
    return ChangeNotifierProvider.value(
      value: _viewModel,
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              padding: context.explorePagePadding,
              decoration: BoxDecoration(
                  color: ColorName.white, borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)), boxShadow: ProductConstants.instance.defaultShadow),
              child: Column(
                children: [
                  context.watch<ExploreViewModel>().state == AppState.ERROR ? _buildError(context) : _advertList(context),
                ],
              ),
            ),
            _mapButton(context),

            // APPLE SHEET LINE
            _sheetLine(),

            // ADVERT DATA
            _advertDataText(draggableHeight)
          ],
        );
      },
    );
  }

  Expanded _advertList(BuildContext context) {
    var adverts = context.read<ExploreViewModel>().adverts;
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: context.mediumValue),
          controller: widget.controller,
          shrinkWrap: true,
          itemCount: adverts!.length,
          itemBuilder: (context, index) {
            return Container(
              padding: index == 0 ? EdgeInsets.only(top: context.width * .24) : EdgeInsets.zero,
              child: AdvertCardWidget(advert: adverts[index]),
            );
          },
        ),
      ),
    );
  }

  Align _mapButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          draggableScrollController.animateTo(.12, duration: const Duration(milliseconds: 300), curve: Curves.linear);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: context.mediumValue),
          width: 90,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            color: ColorName.black.withOpacity(mapButtonOpacity),
          ),
          child: Container(
            padding: context.mapButtonPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(LocaleKeys.map.tr(), style: TextStyle(color: ColorName.white.withOpacity(mapButtonOpacity))),
                const SizedBox(
                  width: 5,
                ),
                Assets.svg.icMap.svg(height: 16, color: ColorName.white.withOpacity(mapButtonOpacity)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align _advertDataText(double draggableHeight) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: draggableHeight * .05),
        child: const Text('data'),
      ),
    );
  }

  Align _sheetLine() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: 40,
        height: 4,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: ColorName.lightGrey,
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context) {
    return Center(
      child: Text(context.watch<ExploreViewModel>().failure.message),
    );
  }
}
