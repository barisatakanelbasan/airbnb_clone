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
            direction: ShimmerDirection.ttb,
            enabled: enabled,
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[200]!,
            child: child,
          )
        : child;
  }
}
