import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game_demo/game/game_root.dart';
import 'package:flame_game_demo/game/physical_objects/marine_animal.dart';

import '../../constants.dart';
import '../../gen/assets.gen.dart';
import '../../utils/position_util.dart';

class Bullet extends SpriteComponent
    with HasGameReference<GameRoot>, CollisionCallbacks {
  Bullet({
    required super.position,
    required this.direction,
  }) : super(
          size: Vector2(20, 40),
          anchor: Anchor.center,
        );

  Vector2 direction;
  final double moveSpeed = 1000;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // 加载子弹的精灵图像
    sprite = await Sprite.load(Assets.images.demo.bullet.keyName);
    angle = PositionUtil.get_angle_from_top(direction);

    // 添加碰撞体
    add(
      RectangleHitbox(
        collisionType: CollisionType.active,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    // 更新子弹位置
    position += direction * dt * moveSpeed;

    // 检测并处理反弹逻辑
    bool hasBounced = false;

    // 确保位置和方向的精度
    if (position.y < -gameHeight / 2 || position.y > gameHeight / 2) {
      direction = Vector2(direction.x, -direction.y);
      hasBounced = true;
    }

    if (position.x < -gameWidth / 2 || position.x > gameWidth / 2) {
      direction = Vector2(-direction.x, direction.y);
      hasBounced = true;
    }

    // 如果发生反弹，更新子弹的角度
    if (hasBounced) {
      angle = PositionUtil.get_angle_from_top(direction);
      // 修正位置以避免浮点数误差导致的反弹异常
      position = Vector2(
        position.x.clamp(-gameWidth / 2, gameWidth / 2),
        position.y.clamp(-gameHeight / 2, gameHeight / 2),
      );
    }

    // // 移出屏幕后移除子弹
    // if (position.y < -gameHeight / 2 - size.y ||
    //     position.y > gameHeight / 2 + size.y ||
    //     position.x < -gameWidth / 2 - size.x ||
    //     position.x > gameWidth / 2 + size.x) {
    //   removeFromParent();
    // }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is MarineAnimal) {
      // 处理子弹打到鱼的逻辑，例如减少鱼的生命值
      // other.takeDamage();
      removeFromParent(); // 子弹打到鱼后移除
    }
  }
}
