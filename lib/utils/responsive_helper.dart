import 'package:flutter/material.dart';

import 'app_constants.dart';

/// Responsive layout helpers for small, medium, and large phones.
class ResponsiveHelper {
  ResponsiveHelper._();

  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 360) return 16;
    if (width < 400) return 18;
    return AppConstants.screenHorizontalPadding;
  }

  /// Bottom inset so list content clears the FAB and system nav bar.
  static double scrollBottomPadding(BuildContext context) {
    return AppConstants.fabSize +
        MediaQuery.paddingOf(context).bottom +
        28;
  }

  static double headerCardHeight(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 360) return 200;
    return AppConstants.headerCardHeight;
  }
}
