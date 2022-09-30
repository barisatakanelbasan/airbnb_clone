import 'package:airbnb_clone/core/constants/app/app_colors.dart';
import 'package:airbnb_clone/core/extensions/context_extension.dart';
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
    return Container(
      padding: context.paddingMediumVertical,
      width: context.width - 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE (square)
          Stack(
            children: [
              Container(
                width: context.width - 40,
                height: context.width - 40,
                decoration: BoxDecoration(
                  color: AppColors().lightGrey,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://picsum.photos/300/200'),
                  ),
                ),
              ),
              // ClipRRect(
              //   borderRadius: const BorderRadius.all(Radius.circular(10)),
              //   child: Image.network(
              //     'https://picsum.photos/1000/2000',
              //     fit: BoxFit.cover,
              //     loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              //       if (loadingProgress == null) return child;

              //       return Center(
              //         child: Container(
              //           width: context.width - 40,
              //           height: context.width - 40,
              //           color: AppColors().grey,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: context.paddingLow,
                  child: Icon(
                    Icons.favorite,
                    color: AppColors().red,
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
