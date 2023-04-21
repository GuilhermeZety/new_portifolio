import 'package:flutter/material.dart';
import 'package:portifolio/core/common/extensions/widget_extension.dart';
import 'package:portifolio/core/constants/app_colors.dart';

class ShimmedBox extends StatelessWidget {
  const ShimmedBox({super.key, this.borderRadius = const BorderRadius.all(Radius.circular(10)), this.height, this.width, this.margin, this.padding, });

  final BorderRadius borderRadius;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.grey_100,
        borderRadius: borderRadius,
      ),
    ).shim();
  }
}