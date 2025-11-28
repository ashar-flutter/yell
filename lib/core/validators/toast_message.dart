import 'package:yell/core/barrel/barrel.dart';

class ToastMessage {
  static void show({
    required BuildContext context,
    required String message,
    bool isError = true,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: isDark
          ? Colors.grey[900]!.withValues(alpha: 0.9)
          : Colors.grey[100]!.withValues(alpha: 0.9),
      textColor: isDark ? AMColors.white : AMColors.black,
      fontSize: 14.0,
      webPosition: "center",
      webBgColor: isDark ? "#2D3748" : "#F7FAFC",
    );
  }
}