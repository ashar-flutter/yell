import 'package:flutter/material.dart';

class AuthHelper {
  AuthHelper._();

  static void setupAutoScroll({
    required FocusNode focusNode,
    required ScrollController scrollController,
    required BuildContext context,
  }) {
    focusNode.addListener(() {
      if (focusNode.hasFocus && scrollController.hasClients) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final renderObject = context.findRenderObject();
          if (renderObject != null) {
            final box = renderObject as RenderBox;
            final position = box.localToGlobal(Offset.zero);
            if (position.dy < 150) {
              scrollController.animateTo(
                scrollController.offset + (150 - position.dy),
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            }
          }
        });
      }
    });
  }

  static void moveToNextField(BuildContext context, FocusNode nextFocusNode) {
    FocusScope.of(context).requestFocus(nextFocusNode);
  }
}