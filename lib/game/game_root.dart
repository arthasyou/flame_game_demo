import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import '../constants.dart';
import 'game_world.dart';

class GameRoot extends FlameGame<GameWorld>
    with HorizontalDragDetector, KeyboardEvents, HasCollisionDetection {
  GameRoot()
      : super(
          world: GameWorld(),
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );
}
