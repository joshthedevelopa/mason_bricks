import '../../imports.dart';

extension ColorExtension on Color {
  Color withAlphaPercentage(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((255.0 * opacity).round());
  }

  int toHex([double opacity = 1]) {
    int r = ((this.r < 0) ? -this.r : this.r).toInt();
    int g = ((this.g < 0) ? -this.g : this.g).toInt();
    int b = ((this.b < 0) ? -this.b : this.b).toInt();

    opacity = (opacity < 0) ? -opacity : opacity;
    opacity = (opacity > 1) ? 255 : opacity * 255;

    r = (r > 255) ? 255 : r;
    g = (g > 255) ? 255 : g;
    b = (b > 255) ? 255 : b;

    int a = opacity.toInt();
    return int.parse(
      '0x${a.toRadixString(16)}'
      '${r.toRadixString(16)}'
      '${g.toRadixString(16)}'
      '${b.toRadixString(16)}',
    );
  }
}
