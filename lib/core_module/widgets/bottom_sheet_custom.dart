import 'package:flutter/material.dart';

class BottomSheetCustom {
  static Future<T?> showBottomSheetCustom<T>(
    BuildContext context,
    Widget? widget, {
    bool dragIsEnable = true,
    bool useRootNavigator = false,
    void Function()? back,
  }) async {
    final result = await showModalBottomSheet<T>(
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      enableDrag: dragIsEnable,
      useRootNavigator: useRootNavigator,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 100),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 42,
                      ),
                      widget!,
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: back ?? () => Navigator.pop(context),
                            child: const Icon(
                              Icons.cancel_outlined,
                              color: Color(0xffAEAFB2),
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    return result;
  }
}
