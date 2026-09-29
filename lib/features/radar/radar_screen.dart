// lib/features/radar/radar_screen.dart
import 'dart:math';
import 'package:flutter/material.dart';

class RadarScreen extends StatefulWidget {
  const RadarScreen({super.key});

  @override
  State<RadarScreen> createState() => _RadarScreenState();
}

class _RadarScreenState extends State<RadarScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radar')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return CustomPaint(
              size: const Size(320, 320),
              painter: _RadarPainter(_controller.value),
            );
          },
        ),
      ),
    );
  }
}

class _RadarPainter extends CustomPainter {
  final double t;
  _RadarPainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.orange.withValues(alpha: 0.25);

    for (int i = 1; i <= 4; i++) {
      canvas.drawCircle(center, 35.0 * i, ringPaint);
    }

    final sweepPaint = Paint()
      ..shader = SweepGradient(
        colors: [
          Colors.transparent,
          Colors.orange.withValues(alpha: 0.55),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
        transform: GradientRotation(t * 2 * pi),
      ).createShader(Rect.fromCircle(center: center, radius: 160));

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 160),
      t * 2 * pi,
      pi / 4,
      true,
      sweepPaint,
    );

    final dotPaint = Paint()..color = Colors.pink;
    final dots = [
      Offset(center.dx + 70 * cos(t * 2 * pi), center.dy + 40 * sin(t * 2 * pi)),
      Offset(center.dx - 90 * cos(t * 2 * pi * 0.8), center.dy - 60 * sin(t * 2 * pi * 0.8)),
      Offset(center.dx + 110 * cos(t * 2 * pi * 1.3), center.dy - 90 * sin(t * 2 * pi * 1.3)),
    ];

    for (final dot in dots) {
      canvas.drawCircle(dot, 8, dotPaint);
      canvas.drawCircle(
        dot,
        16,
        Paint()..color = Colors.pink.withValues(alpha: 0.15),
      );
    }

    canvas.drawCircle(center, 14, Paint()..color = Colors.white);
    canvas.drawCircle(center, 8, Paint()..color = Colors.orange);
  }

  @override
  bool shouldRepaint(covariant _RadarPainter oldDelegate) => oldDelegate.t != t;
}