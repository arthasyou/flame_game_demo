import 'package:flame/extensions.dart';

class BezierCurves {
  static Vector2 calculateBezierPoint(
      double t, Vector2 p0, Vector2 p1, Vector2 p2) {
    final u = 1 - t;
    final tt = t * t;
    final uu = u * u;

    final p = Vector2.zero();
    p.add(p0 * uu); // u^2 * P0
    p.add(p1 * (2 * u * t)); // 2 * u * t * P1
    p.add(p2 * tt); // t^2 * P2

    return p;
  }
}
