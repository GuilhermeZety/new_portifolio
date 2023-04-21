import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'; 
import 'package:portifolio/core/constants/app_colors.dart';


extension Expanding on Widget {
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);
}

extension Heroic on Widget {
  Widget hero(String? tag) => tag != null ? Hero(tag: tag, child: this) : this;
}

extension Shimmer on Widget{
  Widget shim() => animate(onPlay: (controller) => controller.repeat()).shimmer(duration: 3.seconds, color: AppColors.grey_50);
}