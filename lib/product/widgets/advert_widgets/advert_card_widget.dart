import 'package:airbnb_clone/core/extensions/context_extension.dart';
import 'package:airbnb_clone/product/generation/assets.gen.dart';
import 'package:airbnb_clone/product/generation/colors.gen.dart';
import 'package:airbnb_clone/product/widgets/advert_widgets/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdvertCardWidget extends StatelessWidget {
  final List<String>? images;
  final String? location;
  final double? rate;
  final int? distance;
  final List<DateTime>? dates;
  final double? price;
  const AdvertCardWidget({Key? key, this.location, this.rate, this.distance, this.dates, this.price, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var images = [
      'https://picsum.photos/300/200',
      'https://picsum.photos/300/200',
      'https://picsum.photos/300/200',
      'https://picsum.photos/300/200',
      'https://picsum.photos/300/200',
      'https://picsum.photos/300/200',
    ];
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
                Text('data'),
                Text('data'),
              ],
            ),
          ),

          // DISTANCE FROM CURRENT LOCATION
          Padding(
            padding: context.paddingLowVertical,
            child: Text('data'),
          ),

          // DATE
          Text('data'),

          // PRICE / NIGHT
          Padding(
            padding: EdgeInsets.only(top: context.normalValue),
            child: Text('data'),
          ),
        ],
      ),
    );
  }
}
