import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:portifolio/core/common/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/core/constants/app_colors.dart';
import 'package:portifolio/ui/dialogs/toasts.dart';

enum ButtonType {
  filled,
  outlined,
  text,
}

// Custom buttons are created by extending the MaterialButton class
class Button extends StatefulWidget {
  final Future<void> Function()? onPressed;
  final Widget? child;
  final ButtonStyle? style;
  final bool autofocus;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onLongPress;
  final ButtonType? buttonType;
  final Size? size;

  // The constructor made all Custom Button
  const Button({
    super.key,
    required this.onPressed, 
    required this.child,
    this.style,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange, 
    this.onHover, 
    this.onLongPress, 
    this.buttonType, 
    this.size, 
  });



  // The constructor made all Primary Custom Button
  Button.primary({
    super.key,
    required this.onPressed, 
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange, 
    this.onHover, 
    this.onLongPress, 
    this.buttonType = ButtonType.filled,
    this.size,
   }) : style = 
    ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )
      ),
      elevation: MaterialStateProperty.all<double>(2),backgroundColor: AppColors.primaryColor.toMaterialStateProperty(),
      foregroundColor: Colors.black.toMaterialStateProperty(),
      textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    );

    // The constructor made all Primary Custom Button
  Button.transparent({
    super.key,
    required this.onPressed,
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.buttonType = ButtonType.filled,
    this.size,
   }) : style =
    ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )
      ),
      backgroundColor: Colors.transparent.toMaterialStateProperty(),
      foregroundColor: Colors.black.toMaterialStateProperty(),
      textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    );

  // The constructor made all Secondary Custom Button
  Button.secondary({
    super.key,
    required this.onPressed, 
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange, 
    this.onHover, 
    this.onLongPress, 
    this.buttonType = ButtonType.filled, this.size, 
  }) : style = 
  ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: AppColors.grey_100, width: 1)
      )
    ),
    backgroundColor: Colors.white.toMaterialStateProperty(),
    foregroundColor: Colors.black.toMaterialStateProperty(),
    textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
  );

  Button.third({
    super.key,
    required this.onPressed, 
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange, 
    this.onHover, 
    this.onLongPress, 
    this.buttonType = ButtonType.filled, this.size, 
  }) : style = 
  ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      )
    ),
    backgroundColor: AppColors.grey_800.toMaterialStateProperty(),
    foregroundColor: Colors.white.toMaterialStateProperty(),
    textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
  );

  // The constructor made all Primary Custom Button
  const Button.outlined({
    super.key,
    required this.onPressed, 
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange, 
    this.onHover, 
    this.style, 
    this.onLongPress, 
    this.buttonType = ButtonType.outlined, this.size, 
   });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isLoading = false;
  late Future<void> Function() action;

  @override
  void initState() {
    action = () async {
      if(!mounted) return;
      try{
        if(widget.onPressed == null) return;

        isLoading = true;
        if(!mounted) return; setState(() {});

        Vibrate.feedback(FeedbackType.light);
        await widget.onPressed!();
        
        isLoading = false;
        if(!mounted) return; setState(() {});
      }
      catch(err){
        if(!mounted) return;
        Toasting.error(context, 'ButtonError: $err');
      }
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.buttonType == ButtonType.outlined){
      return OutlinedButton(
        onPressed: action,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        focusNode: widget.focusNode,
        onFocusChange: widget.onFocusChange,
        
        onHover: widget.onHover,
        onLongPress: widget.onLongPress,
        style: ButtonStyle().copyWith(
          fixedSize: widget.size != null ? MaterialStateProperty.all<Size>(widget.size!) : null,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Theme.of(context).primaryColor, width: 1)
            )
          ),
          side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Theme.of(context).primaryColor, width: 1)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: Theme.of(context).textTheme.titleMedium!.color!.toMaterialStateProperty(),
          textStyle: MaterialStateProperty.all<TextStyle?>(TextStyle(color: AppColors.grey_100, fontWeight: FontWeight.bold)),
        ), 
        child: isLoading ? LoadingAnimationWidget.staggeredDotsWave(color: AppColors.grey_800, size: 24) : widget.child,
      );
    }
    
    return FilledButton(
      onPressed: action,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChange,
      onHover: widget.onHover,
      onLongPress: widget.onLongPress,
      style: widget.style?.copyWith(fixedSize: widget.size != null ? MaterialStateProperty.all<Size>(widget.size!) : null),
      child: isLoading ? LoadingAnimationWidget.staggeredDotsWave(color: AppColors.grey_800, size: 24) : widget.child,
    );
  }
}