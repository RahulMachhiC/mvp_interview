import 'package:flutter/material.dart';
import 'package:mvp/size_extension.dart';

class MyCustomIndicator extends Decoration {
  final BoxPainter _painter;

  MyCustomIndicator(
      {required Color color, required double height, required double radius})
      : _painter = _IndicatorPainter(color, height, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }

  // @override
  // BoxPainter createBoxPainter({required onChanged}) => _painter;
}

class _IndicatorPainter extends BoxPainter {
  final Paint _paint;
  final double radius;
  final double height;

  _IndicatorPainter(Color color, this.height, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Rect rect = (offset + Offset(-80.w, cfg.size!.height - height) &
        Size(cfg.size!.width + 150.w, height));

    canvas.drawRRect(
      RRect.fromRectAndCorners(rect,
          topLeft: Radius.circular(radius), topRight: Radius.circular(radius)),
      _paint,
    );
  }
}
