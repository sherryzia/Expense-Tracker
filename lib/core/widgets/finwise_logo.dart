import 'package:flutter/material.dart';

/// Rendering of the FinWise brand mark; color comes from the design token.
class FinWiseLogo extends StatelessWidget {
  const FinWiseLogo({
    super.key,
    required this.color,
    required this.width,
    required this.height,
  });

  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(painter: FinWiseLogoPainter(color)),
    );
  }
}

/// Paints the FinWise vector (candlestick chart) in [color].
///
/// Coordinates mirror the source SVG viewBox (118x124).
class FinWiseLogoPainter extends CustomPainter {
  FinWiseLogoPainter(this.color);

  final Color color;

  static const double _viewBoxWidth = 118;
  static const double _strokeWidth = 8.68735;

  @override
  void paint(Canvas canvas, Size size) {
    final double scale = size.width / _viewBoxWidth;
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth * scale
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = color;

    final Path path = Path()
      ..moveTo(55.9255, 119.451)
      ..lineTo(55.9255, 66.5209)
      ..lineTo(77.1915, 66.5209)
      ..lineTo(77.1915, 119.451)
      ..moveTo(20.3187, 119.451)
      ..lineTo(20.3187, 93.7725)
      ..lineTo(41.5847, 93.7725)
      ..lineTo(41.5847, 119.451)
      ..moveTo(92.3903, 119.451)
      ..lineTo(92.3903, 41.2305)
      ..lineTo(113.656, 41.2305)
      ..lineTo(113.656, 119.451)
      ..moveTo(4.34366, 78.1447)
      ..lineTo(49.8378, 32.6505)
      ..lineTo(65.3226, 46.6032)
      ..lineTo(106.547, 5.39897)
      ..moveTo(105.608, 24.234)
      ..lineTo(107.507, 7.03327)
      ..cubicTo(
        107.543,
        6.67129,
        107.497,
        6.30599,
        107.374,
        5.96384,
      )
      ..cubicTo(
        107.25,
        5.62169,
        107.053,
        5.31126,
        106.795,
        5.05507,
      )
      ..cubicTo(
        106.536,
        4.79888,
        106.224,
        4.60336,
        105.881,
        4.48264,
      )
      ..cubicTo(
        105.538,
        4.36192,
        105.173,
        4.31905,
        104.811,
        4.35714,
      )
      ..lineTo(87.6304, 6.25698);

    canvas.save();
    canvas.scale(scale, scale);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant FinWiseLogoPainter oldDelegate) =>
      oldDelegate.color != color;
}