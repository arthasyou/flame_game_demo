import 'package:flame/flame.dart';
import 'package:flame_game_demo/boot.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  await boot();

  runApp(
    const ProviderScope(
      child: GameApp(),
    ),
  );
}
