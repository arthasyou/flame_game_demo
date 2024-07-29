import 'dart:math';

import 'package:flame/components.dart';

class PositionUtil {
  static double get_angle_from_top(Vector2 position) {
    return atan2(position.y, position.x) + pi / 2;
  }

  static Vector2 get_position_from_top(double angle) {
    return Vector2(cos(angle - pi / 2), sin(angle - pi / 2));
  }
}
