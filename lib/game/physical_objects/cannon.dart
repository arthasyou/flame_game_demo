import 'dart:math';
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

  late final TimerComponent _bulletSpawner;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await Sprite.load(Assets.images.demo.barrel.keyName);

    _bulletSpawner = TimerComponent(
      period: 0.2,
      repeat: true,
      onTick: _spawnBullet,
    );

    _bulletSpawner.timer.stop();

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

  void _spawnBullet() {
    final bulletOffset = Vector2(0, -height / 2);
    final rotatedX = bulletOffset.x * cos(angle) - bulletOffset.y * sin(angle);
    final rotatedY = bulletOffset.x * sin(angle) + bulletOffset.y * cos(angle);
    final bulletPosition = position + Vector2(rotatedX, rotatedY);
    final bulletDirection = PositionUtil.get_position_from_top(angle);
    final bullet = Bullet(
      position: bulletPosition,
      direction: bulletDirection,
    );
    game.world.add(bullet);
  }
}
