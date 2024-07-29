import 'package:flame/components.dart';
import 'package:flame_game_demo/game/game_root.dart';

import '../../gen/assets.gen.dart';
import '../../utils/position_util.dart';
import 'bullet.dart';

class Cannon extends SpriteComponent with HasGameReference<GameRoot> {
  Cannon()
      : super(
          size: Vector2(63, 129),
          anchor: Anchor.center,
        );

  late final SpawnComponent _bulletSpawner;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await Sprite.load(Assets.images.demo.barrel.keyName);

    _bulletSpawner = SpawnComponent(
      period: .2,
      selfPositioning: true,
      factory: (index) {
        return Bullet(
          position: position +
              Vector2(
                0,
                -height / 2,
              ),
          direction: PositionUtil.get_position_from_top(angle), // 传递方向
        );
      },
      autoStart: false,
    );

    game.world.add(_bulletSpawner);
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void startShooting() {
    _bulletSpawner.timer.start();
  }

  void stopShooting() {
    _bulletSpawner.timer.stop();
  }

  void rotateTowards(Vector2 targetPosition) {
    final direction = targetPosition - position;
    angle = PositionUtil.get_angle_from_top(direction);
  }
}
