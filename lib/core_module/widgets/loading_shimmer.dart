import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    super.key,
    this.radius = 4,
    this.child,
    this.wrapChild = false,
    this.baseColor,
  });

  final double radius;
  final Widget? child;
  final bool wrapChild;
  final Color? baseColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.withOpacity(0.5),
      highlightColor: Colors.white,
      child: child != null
          ? wrapChild || child is Text
          ? Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: Colors.grey,
        ),
        child: child,
      )
          : child!
          : Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
    );
  }
}
