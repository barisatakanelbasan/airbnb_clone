import 'package:airbnb_clone/product/generation/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;
  final bool enabled;
  const ShimmerWidget({Key? key, required this.child, required this.enabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return enabled
        ? Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            enabled: enabled,
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[200]!,
            period: const Duration(seconds: 1),
            child: Container(
              decoration: const BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              child: child,
            ),
          )
        : child;
  }
}
