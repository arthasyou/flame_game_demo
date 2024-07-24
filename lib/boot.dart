import 'gen/assets.gen.dart';
import 'provider/animal_config_provider.dart';

Future<void> boot() async {
  await AnimalConfig.loadConfigFromFile(Assets.json.marineAnimals);
}
