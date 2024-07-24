import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_game_demo/game/game_root.dart';
import 'package:flame_game_demo/utils/assets_util.dart';

import '../../gen/assets.gen.dart';

enum AnimalState { idle, dead }

class MarineAnimals extends SpriteAnimationGroupComponent
    with HasGameRef<GameRoot> {
  late final SpriteAnimation _idleAnimation;
  late final SpriteAnimation _deadAnimation;

  final String name;
  final int idleFrameAnimationAmount;
  final Vector2 idleSize;
  final int deadFrameAnimationAmount;
  final Vector2 deadSize;
  final int? idelPerRow;
  final int? deadPerRow;

  MarineAnimals({
    required this.name,
    required this.idleFrameAnimationAmount,
    required this.idleSize,
    required this.deadFrameAnimationAmount,
    required this.deadSize,
    this.idelPerRow,
    this.deadPerRow,
  });

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

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
}
