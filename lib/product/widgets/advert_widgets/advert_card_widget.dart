import 'package:airbnb_clone/core/extensions/context_extension.dart';
import 'package:airbnb_clone/product/generation/assets.gen.dart';
import 'package:airbnb_clone/product/generation/colors.gen.dart';
import 'package:airbnb_clone/product/widgets/advert_widgets/carousel_slider.dart';
import 'package:airbnb_clone/view/home/explore/model/advert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/init/lang/locale_keys.g.dart';

class AdvertCardWidget extends StatelessWidget {
  final Advert advert;

  const AdvertCardWidget({Key? key, required this.advert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var images = advert.advertPhotos;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE (square)
          Stack(
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: ColorName.lightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                    width: context.width,
                    height: context.width * .9,
                    child: CarouselSlider(images: images),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: context.paddingLow,
                  child: Assets.svg.icFav.svg(
                    color: ColorName.white,
                    width: context.mediumValue,
                    height: context.mediumValue,
                  ),
                ),
              )
            ],
          ),

          // LOCATION and Star Rating
          Padding(
            padding: EdgeInsets.only(top: context.normalValue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${advert.province}, ${advert.country}'),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 15,
                    ),
                    Text(advert.rating.rate.toString()),
                  ],
                )
              ],
            ),
          ),

          Padding(
            padding: context.paddingLowVertical,
            child: Text(LocaleKeys.advert_list_card_hosted_by.tr(args: ['Barış'])),
          ),

          // DATE
          Text('${advert.availableDate.toDate().month} - ${advert.availableDate.toDate().day}'),

          // PRICE / NIGHT
          Padding(
            padding: EdgeInsets.only(top: context.normalValue),
            child: Text(LocaleKeys.advert_list_card_price_per_night.tr(args: [advert.pricePerNight.toStringAsFixed(2)])),
          ),
        ],
      ),
    );
  }
}
