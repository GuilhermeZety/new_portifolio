import 'package:flutter/material.dart';
import 'package:portifolio/ui/components/shimmed_box.dart';

class Panel extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? child;
  final double? width;
  final double? height;
  final bool withShadow;
  final bool secondary;
  final bool isLoading;
  final Border? border;
  final Color? color;
  final Function()? ontap;
  final bool? clickable;

  const Panel.primary({
    super.key, 
    this.padding = const EdgeInsets.all(10), 
    this.child,
    this.withShadow = true,
    this.secondary = false, 
    this.isLoading = false, 
    this.width,
    this.height,
    this.border,
    this.ontap,
    this.clickable,
    this.color,
  });

  const Panel.secondary({
    super.key, 
    this.padding = const EdgeInsets.all(10), 
    this.child,
    this.withShadow = false,
    this.secondary = true,
    this.isLoading = false, 
    this.width,
    this.height,
    this.border,
    this.ontap,
    this.clickable,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if(isLoading) {
      return ShimmedBox(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
      );
    }
    
    return Container(
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(10),
        boxShadow: withShadow ? [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ] : [],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: color ?? (!secondary ? colorScheme.primaryContainer : colorScheme.secondaryContainer),
        child: InkWell(
          onTap: ontap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}