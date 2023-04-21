import 'package:flutter/material.dart';
import 'package:portifolio/core/common/extensions/widget_extension.dart';
import 'package:portifolio/ui/components/panels.dart';
import 'dart:math' as math;

extension Triangle on Panel{
  Widget triangle(AxisDirection direction, {Size size = const Size(20, 20), double location = 50}){
    if(direction == AxisDirection.up || direction == AxisDirection.down) {
      return Column(
        children: [
          if(direction == AxisDirection.down)
          this,
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: location),
                child: Transform.rotate(
                  angle: direction == AxisDirection.down ? math.pi / 1 : 0,
                  child: ClipPath(
                    clipper: _Triangle(),
                    child: Container(
                      color: Colors.white,
                      width: size.width,
                      height: size.height,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if(direction == AxisDirection.up)
          this,
        ],
      );
    }
    else{
      return Row(
        children: [
          if(direction == AxisDirection.right)
          expanded(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: location),
                child: Transform.rotate(
                  angle: direction == AxisDirection.right ? math.pi / 2 : math.pi / -2,
                  child: ClipPath(
                    clipper: _Triangle(),
                    child: Container(
                      color: Colors.white,
                      width: size.width,
                      height: size.height,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if(direction == AxisDirection.left)
          expanded(),
        ],
      );
    }
      
  }
}

class _Triangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      false;
}