import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_game_demo/game/game_root.dart';
import 'package:flame_game_demo/utils/assets_util.dart';

enum AnimalState { idle, dead }

enum AnimalDircetion { up, down, left, right }

class MarineAnimals extends SpriteAnimationGroupComponent
    with HasGameRef<GameRoot> {
  MarineAnimals({
    required this.name,
    required this.idleFrameAnimationAmount,
    required this.idleSize,
    required this.deadFrameAnimationAmount,
    required this.deadSize,
    this.idelPerRow,
    this.deadPerRow,
  });

  final String name;
  final int idleFrameAnimationAmount;
  final Vector2 idleSize;
  final int deadFrameAnimationAmount;
  final Vector2 deadSize;
  final int? idelPerRow;
  final int? deadPerRow;

  // Animation
  late final SpriteAnimation _idleAnimation;
  late final SpriteAnimation _deadAnimation;

  // Direction
  AnimalDircetion animalDircetion = AnimalDircetion.up;
  double moveSpeed = 0;
  Vector2 velocity = Vector2.zero();

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  // @override
  // void update(double dt) {
  //   // _updateMovement(dt);
  //   super.update(dt);
  // }

  void _loadAllAnimations() {
    _idleAnimation = _spriteAnimation(
      'idle',
      idleFrameAnimationAmount,
      1 / idleFrameAnimationAmount,
      idleSize,
      idelPerRow,
    );
    _deadAnimation = _spriteAnimation(
      'dead',
      deadFrameAnimationAmount,
      1 / deadFrameAnimationAmount,
      deadSize,
      deadPerRow,
    );

    // List of all animations
    animations = {
      AnimalState.idle: _idleAnimation,
      AnimalState.dead: _deadAnimation,
    };

    // set current animation
    current = AnimalState.idle;
    // set anchor
    anchor = Anchor.center;
  }

  SpriteAnimation _spriteAnimation(
    String state,
    int amount,
    double stepTime,
    Vector2 size,
    int? perRow,
  ) {
    return SpriteAnimation.fromFrameData(
      game.customImages
          .fromCache(AssetsUtil.get_animal_image_path(name, state)),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: size,
        amountPerRow: perRow,
      ),
    );
  }

  void _updateMovement(double dt) {
    double dirY = 0.0;
    switch (animalDircetion) {
      case AnimalDircetion.up:
        dirY -= moveSpeed;
        break;
      case AnimalDircetion.down:
        dirY += moveSpeed;
        break;
      default:
    }

    velocity = Vector2(0.0, dirY);
    position += velocity * dt;
  }
}
