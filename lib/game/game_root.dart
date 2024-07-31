import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:flame_game_demo/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../protos/message.pbserver.dart';
import '../services/message_service.dart';
import 'components/game_world.dart';

class GameRoot extends FlameGame with PanDetector, HasCollisionDetection {
  GameRoot({
    required this.ref,
    required this.messageService,
  });

  final GameWorld world = GameWorld();
  late CameraComponent cam;
  final MessageService messageService;
  final WidgetRef ref; // hook_provie相关

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
    // cam.viewfinder.angle = pi;

    addAll([cam, world]);
  }

  @override
  void onPanStart(DragStartInfo info) {
    messageService.sendMessage(ref, 1001, UserInfoArg());
    world.cannon.startShooting();
    super.onPanStart(info);
  }

  @override
  void onPanEnd(DragEndInfo info) {
    world.cannon.stopShooting();
    super.onPanEnd(info);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    world.cannon.rotateTowards(
      cam.globalToLocal(info.eventPosition.global),
    );
    super.onPanUpdate(info);
  }

  void someFun() {
    print("=======test============================================");
  }
}
