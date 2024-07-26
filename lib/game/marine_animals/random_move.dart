import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame_game_demo/game/game_root.dart';
import 'package:flame_game_demo/utils/assets_util.dart';

enum AnimalState { idle, dead }

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
    this.moveSpeed = 30,
  });

  final String name;
  final int idleFrameAnimationAmount;
  final Vector2 idleSize;
  final int deadFrameAnimationAmount;
  final Vector2 deadSize;
  final int? idelPerRow;
  final int? deadPerRow;
  final double moveSpeed;

  // Animation
  late final SpriteAnimation _idleAnimation;
  late final SpriteAnimation _deadAnimation;

  // Direction
  Vector2 velocity = Vector2.zero();
  final Random _random = Random();
  late Timer _directionChangeTimer;

  @override
  Future<void> onLoad() async {
    await _loadAllAnimations();
    _setRandomVelocity();
    _startDirectionChangeTimer();
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _updateMovement(dt);
    _directionChangeTimer.update(dt);
    super.update(dt);
  }

  @override
  void onRemove() {
    _directionChangeTimer.stop();
    super.onRemove();
  }

  Future<void> _loadAllAnimations() async {
    _idleAnimation = await _spriteAnimation(
      'idle',
      idleFrameAnimationAmount,
      1 / idleFrameAnimationAmount,
      idleSize,
      idelPerRow,
    );
    _deadAnimation = await _spriteAnimation(
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

  Future<SpriteAnimation> _spriteAnimation(
    String state,
    int amount,
    double stepTime,
    Vector2 size,
    int? perRow,
  ) async {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache(AssetsUtil.get_animal_image_path(name, state)),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: size,
        amountPerRow: perRow,
      ),
    );
  }

  void _updateMovement(double dt) {
    // print("velocity: $velocity");
    // Update position
    position += velocity * dt;

    // Update angle to match the direction of movement
    if (velocity.length > 0) {
      angle = atan2(velocity.y, velocity.x) + pi / 2;
    }
  }

  void _setRandomVelocity() {
    // Generate a random direction and set the velocity
    double randomAngle = _random.nextDouble() * 2 * pi;
    velocity = Vector2(cos(randomAngle), sin(randomAngle)) * moveSpeed;
  }

  void _startDirectionChangeTimer() {
    // Change direction every 1-3 seconds randomly
    _directionChangeTimer = Timer(
      _random.nextInt(10) + 1,
      onTick: _changeDirection,
      repeat: true,
    );
    _directionChangeTimer.start();
  }

  void _changeDirection() {
    _setRandomVelocity();
  }
}
