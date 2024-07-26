import "package:vector_math/vector_math.dart";
import "package:bezier/bezier.dart";

import 'gen/assets.gen.dart';
import 'provider/animal_config_provider.dart';

Future<void> boot() async {
  final quadraticCurve = QuadraticBezier(
      [Vector2(0.0, -0.0), Vector2(960.0, 500.0), Vector2(1920.0, 0.0)]);
  final a = quadraticCurve.pointAt(0.0167);
  print(a);

  await AnimalConfig.loadConfigFromFile(Assets.json.marineAnimals);
}
