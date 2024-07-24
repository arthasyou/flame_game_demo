import 'package:flame/extensions.dart';

import '../constants.dart';
import '../game/marine_animals/marine_animals.dart';
import '../provider/animal_config_provider.dart';

class AssetsUtil {
  static get_animal_image_path(String name, String state) {
    return '${imagePrefix}${name}/${state}.png';
  }

  static MarineAnimals create_animal(String name) {
    final cfg = AnimalConfig.getAnimal(name)!;
    return MarineAnimals(
      name: name,
      idleFrameAnimationAmount: cfg.idleFrameAnimationAmount,
      idleSize: Vector2(cfg.idleSize[0], cfg.idleSize[1]),
      deadFrameAnimationAmount: cfg.deadFrameAnimationAmount,
      deadSize: Vector2(cfg.deadSize[0], cfg.deadSize[1]),
      idelPerRow: cfg.idlePerRow,
      deadPerRow: cfg.deadPerRow,
    );
  }
}
