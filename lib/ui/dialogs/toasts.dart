import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portifolio/core/constants/app_colors.dart';
class Toasting{
  /// It shows a toast message on the screen.
  /// 
  /// Args:
  ///   message (String): The message you want to display
  ///   color (Color): The color of the toast.
  static void showToast(BuildContext context, String message, Color color, {double opacity = 1, ToastGravity gravity = ToastGravity.TOP, bool replace = true, Duration? duration}){
    FToast ftoast = FToast().init(context);
    if(replace) ftoast.removeQueuedCustomToasts();
    ftoast.showToast(
      gravity: gravity, 
      toastDuration: duration ?? 3.seconds,
      child: Container(
        padding: EdgeInsets.only(left: 20), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color.withOpacity(opacity), 
        ),
        child: Row(
          children: [
            Expanded(child: Text(message, style: TextStyle(color: Colors.white),)),
            IconButton(icon: Icon(Icons.close, color: Colors.white,), onPressed: () => ftoast.removeCustomToast(),)
          ],
        ))
    );
  }

  static void error(BuildContext context, String message, {ToastGravity gravity = ToastGravity.TOP}){
    Vibrate.feedback(FeedbackType.error);
    showToast(context, message, AppColors.errorColor, duration: 60.seconds, gravity: gravity);
  }

  static void info(BuildContext context, String message, {bool replace = true}){
    Vibrate.feedback(FeedbackType.light);
    showToast(context, message, Colors.blue.shade700, replace: replace);
  }

  static void success(BuildContext context, String message){
    Vibrate.feedback(FeedbackType.success);
    showToast(context, message, Colors.green.shade400);
  }

  static void noConnection(BuildContext context){
    Vibrate.feedback(FeedbackType.error);
    showToast(context, 'Sem conexão com a internet', AppColors.errorColor, duration: 60.seconds);
  }

  static void connectionRequired(BuildContext context){
    Vibrate.feedback(FeedbackType.heavy);
    showToast(context, 'Não é possivel efetuar está ação sem acesso à internet!', AppColors.errorColor, duration: 60.seconds);
  }
  
  static void warning(BuildContext context, String message){
    Vibrate.feedback(FeedbackType.warning);
    showToast(context, message, Colors.orange);
  }
}