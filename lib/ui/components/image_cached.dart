import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portifolio/core/common/extensions/widget_extension.dart';
import 'package:portifolio/core/constants/app_colors.dart';
import 'package:portifolio/ui/components/shimmed_box.dart';

class ImageCached extends StatelessWidget {
  const ImageCached({
    super.key, 
    this.url, 
    this.heroTag, 
    this.fit, 
    this.size = const Size(double.infinity, double.infinity),
    this.borderRadius = const BorderRadius.all(Radius.circular(10)), 
    this.fadeDuration = const Duration(milliseconds: 500),
    this.fromLocal = false,
  });

  final String? url;
  final String? heroTag;
  final BorderRadius borderRadius;
  final Size size;
  final Duration fadeDuration;
  final bool fromLocal;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if(url == null) return _errorWidget();
  
    return ClipRRect(
      borderRadius: borderRadius,
      child: fromLocal ?
        Image.file(File(url!), height: size.height, width: size.width, fit: fit ?? BoxFit.cover,)
      :
      CachedNetworkImage(
        imageUrl: url!, 
        height: size.height,
        width: size.width,
        fadeInDuration: fadeDuration,
        fit: fit ?? BoxFit.cover,
        errorWidget: (context, url, error) => _errorWidget(),
        placeholder: (context, url) => _loadingWidget()
      ),
    ).hero(heroTag);
  }

  Widget _loadingWidget() => ShimmedBox(
    height: size.height,
    width: size.width,
    borderRadius: borderRadius,
  );

  Container _errorWidget() => Container(
    height: size.height,
    width: size.width,
    decoration: BoxDecoration(
      borderRadius: borderRadius,
      color: AppColors.grey_100,
    ),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Icon(Icons.error_outline, color: AppColors.grey_800.withOpacity(0.6), size: size.width < 100 ? 20 : 30,),
          Gap(2),
          Text('Sem Imagem', style: TextStyle(color: AppColors.grey_800.withOpacity(0.6), fontSize: size.width < 100 ? 10 : 12, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
        ],
      )),
  );
}