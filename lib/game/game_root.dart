import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_game_demo/constants.dart';
import 'game_world.dart';

class GameRoot extends FlameGame {
  // with HorizontalDragDetector, KeyboardEvents, HasCollisionDetection {
  // GameRoot() : super();

  final world = GameWorld();
  late CameraComponent cam;

  @override
  FutureOr<void> onLoad() async {
    images.prefix = '';
    await images.loadAllImages();

    _loadWorld();

    return super.onLoad();
  }

  void _loadWorld() {
    cam = CameraComponent.withFixedResolution(
      world: world,
      width: gameWidth,
      height: gameHeight,
    );
    cam.viewfinder.anchor = Anchor.topLeft;

    addAll([cam, world]);
  }
}
