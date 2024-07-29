import 'package:flame/components.dart';
import 'package:flame_game_demo/game/components/common/ellipse_component.dart';

class CollisionBlock extends PositionComponent {
  bool isBackground;

  CollisionBlock({
    position,
    size,
    this.isBackground = false,
  }) : super(
          position: position,
          size: size,
          anchor: Anchor.center,
        ) {
    debugMode = true;
  }
}

class CE extends EllipseComponent {
  CE({
    position,
    size,
  }) : super(position: position, width: 200, height: 100) {
    debugMode = true;
  }
}
