import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portifolio/core/common/extensions/widget_extension.dart';
import 'package:portifolio/core/constants/app_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key, required this.child, this.margin});

  final Widget child;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Colors.transparent,
                  AppColors.grey_200,
                ]
              )
            ),
          ).expanded(),
          Gap(5),
          child,
          Gap(5),
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  AppColors.grey_200,
                  Colors.transparent,
                ]
              )
            ),
          ).expanded()
        ],
      ),
    );
  }
}