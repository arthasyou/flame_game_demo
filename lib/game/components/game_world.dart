import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame_game_demo/constants.dart';
import 'package:flame_game_demo/game/components/common/collision_block.dart';
import 'package:flame_game_demo/game/physical_objects/cannon.dart';
import '../../utils/assets_util.dart';
import '../game_root.dart';
import '../physical_objects/marine_animal.dart';

class GameWorld extends World with HasGameRef<GameRoot> {
  late CollisionBlock backgroud;
  final List<MarineAnimal> animals = [];
  late Cannon cannon;

  @override
  FutureOr<void> onLoad() {
    // background
    backgroud = CollisionBlock(
      position: Vector2.zero(),
      size: Vector2(gameWidth, gameHeight),
      isBackground: true,
    );
    add(backgroud);

    // animals
    for (int i = 1; i < 15; i++) {
      MarineAnimal fish = AssetsUtil.create_animal(i.toString());
      add(fish);
    }

    cannon = Cannon()..position = Vector2(500, 500);
    // cannon = Cannon();
    add(cannon);

    // final ce = CE();
    // add(ce);

    return super.onLoad();
  }
}
