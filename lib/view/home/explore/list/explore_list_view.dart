import 'package:airbnb_clone/core/extensions/context_extension.dart';
import 'package:airbnb_clone/product/constants/product_constants.dart';
import 'package:airbnb_clone/product/widgets/advert_widgets/advert_card_widget.dart';
import 'package:flutter/material.dart';
import '../../../../product/generation/colors.gen.dart';

class ExploreListView extends StatefulWidget {
  final ScrollController controller;
  const ExploreListView({Key? key, required this.controller}) : super(key: key);

  @override
  State<ExploreListView> createState() => _ExploreListViewState();
}

class _ExploreListViewState extends State<ExploreListView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: context.explorePagePadding,
          decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              boxShadow: ProductConstants().defaultShadow),
          child: Column(
            children: [
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    controller: widget.controller,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: index == 0 ? EdgeInsets.only(top: context.mediumValue * 2) : EdgeInsets.zero,
                        child: AdvertCardWidget(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: EdgeInsets.only(top: context.mediumValue * 1.1),
            child: Text('data'),
          ),
        )
      ],
    );
  }
}
