import 'provider/animal_config_provider.dart';

Future<void> boot() async {
  await AnimalConfig.loadConfigFromFile('assets/json/marine_animals.json');
}
