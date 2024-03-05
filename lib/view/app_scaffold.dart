import 'package:flutter/material.dart';
import 'package:sized_context/sized_context.dart';
import 'package:titans_crypto/main.dart';
import 'package:titans_crypto/view/styles/styles.dart';
import 'package:titans_crypto/view/utils/app_scroll_behavior.dart';

class TitansCryptoAppScaffold extends StatelessWidget {
  const TitansCryptoAppScaffold({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  static AppStyle get style => _style;
  static AppStyle _style = AppStyle();

  @override
  Widget build(BuildContext context) {
    // Listen to the device size, and update AppStyle when it changes
    final mq = MediaQuery.of(context);
    appLogic.handleAppSizeChanged(mq.size);
    // Create a style object that will be passed down the widget tree
    _style = AppStyle(screenSize: context.sizePx);
    return KeyedSubtree(
      key: ValueKey($styles.scale),
      child: Theme(
        data: $styles.colors.toThemeData(),
        // Provide a default texts style to allow Hero's to render text properly
        child: DefaultTextStyle(
          style: $styles.text.bodyMedium,
          // Use a custom scroll behavior across entire app
          child: ScrollConfiguration(
            behavior: AppScrollBehavior(),
            child: child,
          ),
        ),
      ),
    );
  }
}
