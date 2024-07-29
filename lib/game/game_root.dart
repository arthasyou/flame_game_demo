import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:flame_game_demo/constants.dart';
import 'components/game_world.dart';

class GameRoot extends FlameGame
    with PanDetector, MouseMovementDetector, HasCollisionDetection {
  final GameWorld world = GameWorld();
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
    cam.viewfinder.anchor = Anchor.center;

    addAll([cam, world]);
  }

  @override
  void onPanStart(DragStartInfo info) {
    world.cannon.startShooting();
    super.onPanStart(info);
  }

  @override
  void onPanEnd(DragEndInfo info) {
    world.cannon.stopShooting();
    super.onPanEnd(info);
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    // print("global: ${info.eventPosition.global}");
    // print("widget: ${info.eventPosition.widget}");
    // final a = cam.globalToLocal(info.eventPosition.global);
    // print(a);

    world.cannon.rotateTowards(
      cam.globalToLocal(info.eventPosition.global),
    ); // Rotate cannon towards mouse position
  }
}
