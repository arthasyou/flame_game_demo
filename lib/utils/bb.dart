import 'dart:math';

import 'package:flame/extensions.dart';

void main() {
  Vector2 p0 = Vector2(0, 0);
  Vector2 p1 = Vector2(1, 2);
  Vector2 p2 = Vector2(2, 0);

  double totalTime = 5.0; // 总时间，物体沿贝塞尔曲线运动的时间
  double timeStep = 0.01; // 时间步长
  List<Vector2> points = [];
  List<double> lengths = [];

  // 1. 离散化贝塞尔曲线
  for (double t = 0; t <= 1; t += timeStep) {
    points.add(_calculateBezierPoint(t, p0, p1, p2));
  }

  // 2. 计算累积长度
  double totalLength = 0;
  for (int i = 0; i < points.length - 1; i++) {
    double segmentLength = (points[i + 1] - points[i]).length;
    totalLength += segmentLength;
    lengths.add(totalLength);
  }

  // 3. 重新映射 t 值
  double targetSpeed = totalLength / totalTime;
  double currentTime = 0;
  for (double t = 0; t <= totalTime; t += timeStep) {
    double currentLength = targetSpeed * t;
    Vector2 position = _getPositionAtLength(points, lengths, currentLength);
    print('Time: $t, Position: $position');
    currentTime += timeStep;
  }
}

Vector2 _calculateBezierPoint(double t, Vector2 p0, Vector2 p1, Vector2 p2) {
  final u = 1 - t;
  final tt = t * t;
  final uu = u * u;

  final p = Vector2.zero();
  p.add(p0 * uu); // u^2 * P0
  p.add(p1 * (2 * u * t)); // 2 * u * t * P1
  p.add(p2 * tt); // t^2 * P2

  return p;
}

Vector2 _getPositionAtLength(
    List<Vector2> points, List<double> lengths, double length) {
  for (int i = 0; i < lengths.length - 1; i++) {
    if (lengths[i] <= length && length <= lengths[i + 1]) {
      double segmentLength = lengths[i + 1] - lengths[i];
      double segmentFraction = (length - lengths[i]) / segmentLength;
      // return Vector2.lerp(points[i], points[i + 1], segmentFraction);
    }
  }
  return points.last;
}
