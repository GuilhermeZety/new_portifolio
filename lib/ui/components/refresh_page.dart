import 'dart:async';
import 'dart:developer';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:portifolio/core/common/extensions/context_extension.dart';
import 'package:portifolio/core/constants/app_colors.dart';
import 'package:portifolio/ui/components/divider_widget.dart';

class RefreshPage extends StatefulWidget {
  const RefreshPage({super.key, required this.onRefresh, required this.child, this.controller, this.onScrollToEnd, this.ended, this.paddingEnded});

  final Future<void> Function() onRefresh;
  final Future<void> Function()? onScrollToEnd;
  final bool? ended;
  final Widget child;
  final EdgeInsets? paddingEnded;

  final IndicatorController? controller;

  @override
  State<RefreshPage> createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  ScrollController scrollController = ScrollController();

  bool loadingMore = false;
  
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() async {
      if(widget.ended == true) return;
      
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        log('Scroll to end');
        if(widget.onScrollToEnd == null) return;

        loadingMore = true;
        if(mounted) setState(() {});

        await widget.onScrollToEnd!();

        loadingMore = false;
        if(mounted) setState(() {});
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      key: widget.key,
      controller: widget.controller,
      builder: MaterialIndicatorDelegate(
        withRotation: false,
        builder: (context, controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: context.theme.primaryColor,
              size: 24,
            ),
          );
        },
      ),
      onRefresh: ()async {
        for(var i = 0; i < 5; i++){
          await Future.delayed(Duration(milliseconds: 100));
          Vibrate.feedback(FeedbackType.light);
        }

        return widget.onRefresh();
      },
      child: SingleChildScrollView(
        controller: scrollController,
        physics: AlwaysScrollableScrollPhysics(), child: Column(
          children: [
            widget.child,
            if(widget.ended == true)
             Container(padding: widget.paddingEnded, child: DividerWidget(child: Text('Sem mais resultados')))
            else
              Container(
                margin: widget.paddingEnded,
                height: 20,
              ),
             if(loadingMore)
             Container(
              padding: widget.paddingEnded,
              alignment: Alignment.center,
              child: LoadingAnimationWidget.stretchedDots(color: AppColors.primaryColor, size: 30),
             )
          ],
        )),
    );
    
  }
}