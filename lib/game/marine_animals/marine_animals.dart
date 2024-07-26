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
    await _loadAllAnimations();
    _setRandomTarget();
    return super.onLoad();
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
      tempPoint =
          _calculateBezierPoint(t, startPoint, controlPoint, targetPoint);
      velocity = tempPoint - position;
      direction = velocity.normalized();
      _isEndOfTemp = false;
    }

    start_moving(dt);
  }

  void start_moving(double dt) {
    position += direction * moveSpeed * dt;
    if (velocity.length > 0) {
      angle = atan2(velocity.y, velocity.x) + pi / 2;
    }
    if ((position - tempPoint).length <= moveSpeed * dt) {
      position = tempPoint;
      _isEndOfTemp = true;
    }
  }

  Vector2 _calculateBezierPoint(double t, Vector2 p0, Vector2 p1, Vector2 p2) {
    final u = 1 - t;
    final tt = t * t;
    final uu = u * u;

    Vector2 p = Vector2.zero();
    p = p0 * uu; // u^2 * P0
    p.add(p1 * (2 * u * t)); // 2 * u * t * P1
    p.add(p2 * tt); // t^2 * P2

    return p;
  }

  void _setRandomTarget() {
    startPoint = position;
    // Generate a random target point within the game bounds
    final targetX = _random.nextDouble() * gameRef.size.x;
    final targetY = _random.nextDouble() * gameRef.size.y;
    targetPoint = Vector2(targetX, targetY);
    // targetPoint = Vector2(1920, 0);

    // Generate a random control point for the bezier curve
    final controlX = _random.nextDouble() * gameRef.size.x;
    final controlY = _random.nextDouble() * gameRef.size.y;
    controlPoint = Vector2(controlX, controlY);
    // controlPoint = Vector2(960, 500);

    // print(
    //     "start: $startPoint, controlPoint: $controlPoint, targetPoint$targetPoint");

    t = 0.0; // Reset t for the new curve
  }
}
