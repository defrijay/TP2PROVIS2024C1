import 'package:flutter/material.dart';
import 'package:defrizal_yahdiyan_risyad_s_application2/core/utils/size_utils.dart';
import 'package:defrizal_yahdiyan_risyad_s_application2/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Title text style
  static get titleSmallAmber800 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.amber800,
        fontSize: 15.fSize,
      );
  static get titleSmallClashDisplayVariableOnPrimaryContainer =>
      theme.textTheme.titleSmall!.clashDisplayVariable.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 15.fSize,
      );
}

extension on TextStyle {
  TextStyle get clashDisplayVariable {
    return copyWith(
      fontFamily: 'Clash Display Variable',
    );
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }
}
