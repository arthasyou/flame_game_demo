import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'game/game_root.dart';
import 'services/message_service.dart';
import 'services/web_socket_service.dart';

class GamePage extends ConsumerStatefulWidget {
  const GamePage({super.key});

  @override
  ConsumerState<GamePage> createState() => _GamePageState();
}

class _GamePageState extends ConsumerState<GamePage> {
  late final GameRoot game;
  late final MessageService _messageService;

  @override
  void initState() {
    super.initState();
    _messageService = MessageService();
    ref
        .read(webSocketProvider)
        .addListener(() => _messageService.onMessageReceived(ref));
    game = GameRoot(ref: ref, messageService: _messageService);
    _messageService.setGameRoot(game);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(game: game),
    );
  }
}
