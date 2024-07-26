import 'dart:async';

import 'package:flame/components.dart';

import '../utils/assets_util.dart';
import 'game_root.dart';
import 'marine_animals/marine_animals.dart';

class GameWorld extends World with HasGameRef<GameRoot> {
  late final MarineAnimals fish;

  @override
  FutureOr<void> onLoad() {
    for (int i = 1; i < 15; i++) {
      MarineAnimals fish = AssetsUtil.create_animal(i.toString());
      add(fish);
    }

    return super.onLoad();
  }
}
