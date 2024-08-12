import 'dart:typed_data';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:protobuf/protobuf.dart';
import '../gen/proto_mapping.dart';
import '../protos/message.pb.dart';
import '../provider/slot_machine_provider.dart';
import 'proto_service.dart';
import 'web_socket_service.dart';
import '../game/game_root.dart'; // 确保导入GameRoot

class MessageService {
  final ProtoHandler _protoHandler = ProtoHandler();
  final MessageHandler _messageHandler = MessageHandler();
  GameRoot? _game; // 添加GameRoot实例

  // Private constructor
  MessageService._internal();

  // Singleton instance
  static final MessageService _instance = MessageService._internal();

  // Factory constructor
  factory MessageService() {
    return _instance;
  }

  void setGameRoot(GameRoot game) {
    _game = game;
  }

  void onMessageReceived(WidgetRef ref) {
    final webSocketNotifier = ref.read(webSocketProvider);

    _game?.someFun();

    // final gameNotifier = ref.read(slotMachineProvider);
    if (webSocketNotifier.messages.isNotEmpty) {
      // Get the last received message
      WebSocketMessage messageBytes = webSocketNotifier.messages.last;

      try {
        final messageType = cmdToName(messageBytes.cmd);

        print("messageType: $messageType");
        final message =
            _protoHandler.parseMessage(messageType, messageBytes.data);
        print(message);
        // _messageHandler.handle(message, gameNotifier);
        // Handle the parsed message
      } catch (e) {
        print('Failed to parse message: $e');
      } finally {
        // Remove the last message from the list
        webSocketNotifier.messages.removeLast();
      }
    }
  }

  void sendMessage(WidgetRef ref, int cmd, dynamic message) {
    final webSocketNotifier = ref.read(webSocketProvider);

    // 将消息序列化为字节数组
    Uint8List messageBody = Uint8List.fromList(message.writeToBuffer());

    // 发送消息
    webSocketNotifier.sendMessage(messageBody, cmd);
  }
}

class MessageHandler {
  void handle(GeneratedMessage message, SlotMachineProvider provider) {
    if (message is UserInfoResult) {
      _handleUserInfoResult(message, provider);
    } else if (message is FruitPlayResult) {
      _handleFruitPlayResult(message, provider);
    } else if (message is BsPlayResult) {
      _handleBsPlayResult(message, provider);
    } else {
      print("Error: Unsupported message type ${message.runtimeType}");
    }
  }

  void _handleUserInfoResult(
    UserInfoResult message,
    SlotMachineProvider provider,
  ) {
    // print("balance: ${message.balance}");
    provider.setCoin(message.balance);
    provider.setShouldUpdateCoin(true);
  }

  void _handleFruitPlayResult(
    FruitPlayResult message,
    SlotMachineProvider provider,
  ) {
    // print("lights: ${message.lights}");
    provider.setLights(message.lights);
    provider.setCoin(message.balance);
    provider.setOdds(message.odds);
    provider.setWin(message.win);
    provider.setBetsHistory(message.fruits);
    provider.setShouldStartSpinning(true);
  }

  void _handleBsPlayResult(
    BsPlayResult message,
    SlotMachineProvider provider,
  ) {
    provider.setCoin(message.balance);
    provider.setWin(message.win);
    provider.setBs(message.result);
    provider.setShouldStartBOS(true);
  }
}
