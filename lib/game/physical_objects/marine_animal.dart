import 'dart:async';
import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game_demo/game/game_root.dart';
import 'package:flame_game_demo/utils/Bezier_Curves.dart';
import 'package:flame_game_demo/utils/assets_util.dart';
import 'package:flame_game_demo/utils/position_util.dart';

enum AnimalState { idle, dead }

class MarineAnimal extends SpriteAnimationGroupComponent
    with HasGameRef<GameRoot> {
  MarineAnimal({
    required this.name,
    required this.idleFrameAnimationAmount,
    required this.idleSize,
    required this.deadFrameAnimationAmount,
    required this.deadSize,
    this.idelPerRow,
    this.deadPerRow,
    required this.moveSpeed,
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

  // bezier_curves
  double bezierCurvesRate = 100; // 数字越大分割越细
  Vector2 controlPoint = Vector2.zero();
  Vector2 targetPoint = Vector2.zero();
  Vector2 startPoint = Vector2.zero();
  double t = 0.0;
  Vector2 tempPoint = Vector2.zero();
  bool _isEndOfTemp = true;
  Vector2 direction = Vector2.zero();

  // others
  final Random _random = Random();
  late Timer _directionChangeTimer;

  @override
  Future<void> onLoad() async {
    await super.onLoad;
    await _loadAllAnimations();
    _setRandomTarget();
    // 添加碰撞体
    add(
      RectangleHitbox(
        collisionType: CollisionType.passive,
      ),
    );
  }

  @override
  void update(double dt) {
    _updateMovement(dt);
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
    if (t > 1.0) {
      t = 1.0;
      _moving(dt);
      _setRandomTarget();
    } else {
      _moving(dt);
    }
  }

  void _moving(double dt) {
    if (_isEndOfTemp) {
      t += dt * moveSpeed / bezierCurvesRate; // Adjust speed here
      tempPoint = BezierCurves.calculateBezierPoint(
          t, startPoint, controlPoint, targetPoint);
      velocity = tempPoint - position;
      direction = velocity.normalized();
      _isEndOfTemp = false;
    }

    start_moving(dt);
  }

  void start_moving(double dt) {
    position += direction * moveSpeed * dt;
    if (velocity.length > 0) {
      angle = PositionUtil.get_angle_from_top(velocity);
    }
    if ((position - tempPoint).length <= moveSpeed * dt) {
      position = tempPoint;
      _isEndOfTemp = true;
    }
  }

  void _setRandomTarget() {
    startPoint = position;

    // Generate a random target point within the game bounds
    final targetX = _random.nextDouble() * gameRef.size.x - gameRef.size.x / 2;
    final targetY = _random.nextDouble() * gameRef.size.y - gameRef.size.y / 2;
    targetPoint = Vector2(targetX, targetY);

    // Generate a random control point for the bezier curve
    final controlX = _random.nextDouble() * gameRef.size.x - gameRef.size.x / 2;
    final controlY = _random.nextDouble() * gameRef.size.y - gameRef.size.y / 2;
    controlPoint = Vector2(controlX, controlY);

    t = 0.0; // Reset t for the new curve
  }
}
