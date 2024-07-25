import 'dart:async';

import 'package:flame/components.dart';

import '../utils/assets_util.dart';
import 'game_root.dart';
import 'marine_animals/marine_animals.dart';

class GameWorld extends World with HasGameRef<GameRoot> {
  late final MarineAnimals fish;

  @override
  FutureOr<void> onLoad() {
    // fish = MarineAnimalsUtil.create_animal_number_1();

    // fish = AssetsUtil.create_animal('1');
    // add(fish);

    // MarineAnimals fish2 = AssetsUtil.create_animal('2');
    // add(fish2);

    // MarineAnimals fish3 = AssetsUtil.create_animal('3');
    // add(fish3);

    MarineAnimals fish4 = AssetsUtil.create_animal('2')
      ..position = Vector2(0, 0);
    add(fish4);

    return super.onLoad();
  }
}
