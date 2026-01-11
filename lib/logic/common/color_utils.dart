import 'package:flutter/cupertino.dart';

class ColorUtils {
  /// Shift lightness using HSL color space
  static Color shiftHsl(Color color, [double amount = 0.0]) {
    final hsl = HSLColor.fromColor(color);

    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Parse hex color like "#RRGGBB" or "RRGGBB"
  static Color parseHex(String hex) {
    final value = hex.replaceFirst('#', '');
    return Color(int.parse(value, radix: 16) | 0xFF000000);
  }

  /// Blend two colors using opacity (0.0 - 1.0)
  static Color blend(Color base, Color overlay, double opacity) {
    int channel(double b, double o) {
      return ((b * (1.0 - opacity) + o * opacity) * 255.0).round().clamp(
        0,
        255,
      );
    }

    return Color.fromARGB(
      ((base.a * 255.0).round()).clamp(0, 255),
      channel(base.r, overlay.r),
      channel(base.g, overlay.g),
      channel(base.b, overlay.b),
    );
  }
}
