import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

abstract class AppStyles {
  /// ------ Text Styles -----

  static TextStyle boardingTitleStyle = TextStyle(
    color: CupertinoColors.black,
    fontSize: AppSizes.fontSizeHigh,
    fontWeight: FontWeight.w900,
  );

  static TextStyle boardingSubtitleStyle = TextStyle(
    color: CupertinoColors.black,
    fontSize: AppSizes.fontSizeMedium,
    fontWeight: FontWeight.w400,
  );

  static TextStyle ctaButtonTextStyle = TextStyle(
    color: CupertinoColors.white,
    fontSize: AppSizes.fontSizeRegular,
    fontWeight: FontWeight.w500,
  );

  static TextStyle appBarPageTextStyle = TextStyle(
    color: CupertinoColors.black,
    fontSize: AppSizes.fontSizeMedium,
    fontWeight: FontWeight.w500,
  );

  static TextStyle questionTitleTextStyle = TextStyle(
    color: CupertinoColors.black,
    fontSize: AppSizes.fontSizeSmall,
    fontWeight: FontWeight.w500,
  );

  static TextStyle questionSubtitleTextStyle = TextStyle(
    color: CupertinoColors.black,
    fontSize: AppSizes.fontSizeMini,
    fontWeight: FontWeight.w500,
  );

  static TextStyle labelTextStyle = TextStyle(
    color: CupertinoColors.inactiveGray,
    fontSize: AppSizes.fontSizeMini,
    fontWeight: FontWeight.w600,
  );

}