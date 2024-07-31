import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:async';
import '../provider/jwt_provider.dart';

class WebSocketMessage {
  final int errorCode;
  final int cmd;
  final int length;
  final Uint8List data;

  WebSocketMessage({
    required this.errorCode,
    required this.cmd,
    required this.length,
    required this.data,
  });
}

class WebSocketNotifier extends ChangeNotifier {
  static final WebSocketNotifier _instance = WebSocketNotifier._internal();
  late WebSocketChannel _channel;
  final List<WebSocketMessage> _messages = [];
  List<WebSocketMessage> get messages => _messages;

  StreamSubscription? _subscription;
  Timer? _heartBeatTimer;
  bool _isReconnecting = false;
  bool _isInitialized = false;

  late String jwt;

  factory WebSocketNotifier(String jwt) {
    _instance._initialize(jwt);
    return _instance;
  }

  WebSocketNotifier._internal();

  void _initialize(String jwt) {
    if (_isInitialized) return; // 防止重复初始化
    this.jwt = jwt;
    _isInitialized = true;
    _connect();
  }

  void _connect() {
    _channel = WebSocketChannel.connect(
      // Uri.parse('wss://wap-v101-gtmservice.rosetts.com/ws/fruit?token=$jwt'),
      Uri.parse('ws://127.0.0.1:8080'),
    );

    _subscription = _channel.stream.listen(
      (message) {
        if (message is List<int>) {
          Uint8List data = Uint8List.fromList(message);
          WebSocketMessage parsedMessage = _parseMessage(data);
          if (parsedMessage.errorCode == 0) {
            _messages.add(parsedMessage);
            notifyListeners();
            if (kDebugMode) {
              print('going recive========================');
            }
          } else {
            if (kDebugMode) {
              print("error code: ${parsedMessage.errorCode}");
            }
          }
        }
      },
      onDone: _onDone,
      onError: _onError,
    );

    _startHeartBeat();
  }

  void _startHeartBeat() {
    _heartBeatTimer?.cancel();
    _heartBeatTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      _sendHeartBeat();
    });
  }

  void _sendHeartBeat() {
    sendMessage(Uint8List.fromList([0]), 0, 0); // 示例心跳包
  }

  void _onDone() {
    if (kDebugMode) {
      print("Connection closed");
    }
    _heartBeatTimer?.cancel();
    if (!_isReconnecting) {
      _reconnect();
    }
  }

  void _onError(error) {
    if (kDebugMode) {
      print("WebSocket error: $error");
    }
    if (!_isReconnecting) {
      _reconnect();
    }
  }

  void _reconnect() {
    _isReconnecting = true;
    _subscription?.cancel();
    _channel.sink.close(status.goingAway).then((_) {
      Future.delayed(const Duration(seconds: 5), () {
        _isReconnecting = false;
        _connect();
      });
    });
  }

  void sendMessage(Uint8List data, int errorCode, int cmd) {
    ByteData header = ByteData(6);
    header.setUint16(0, errorCode, Endian.big);
    header.setUint16(2, cmd, Endian.big);
    header.setUint16(4, data.length, Endian.big);

    Uint8List messageBytes = Uint8List(header.lengthInBytes + data.length);
    messageBytes.setRange(0, header.lengthInBytes, header.buffer.asUint8List());
    messageBytes.setRange(header.lengthInBytes, messageBytes.length, data);
    _channel.sink.add(messageBytes);
  }

  WebSocketMessage _parseMessage(Uint8List data) {
    if (data.length < 6) {
      throw Exception('Invalid data length');
    }

    ByteData byteData = ByteData.sublistView(data);
    int errorCode = byteData.getUint16(0, Endian.big);
    int cmd = byteData.getUint16(2, Endian.big);
    int length = byteData.getUint16(4, Endian.big);

    if (data.length < 6 + length) {
      throw Exception('Invalid data length');
    }

    return WebSocketMessage(
      errorCode: errorCode,
      cmd: cmd,
      length: length,
      data: data.sublist(6, 6 + length),
    );
  }

  @override
  void dispose() {
    _heartBeatTimer?.cancel();
    _subscription?.cancel();
    _channel.sink.close(status.goingAway);
    super.dispose();
  }
}

final webSocketProvider = ChangeNotifierProvider<WebSocketNotifier>((ref) {
  final jwt = ref.read(jwtProvider);
  return WebSocketNotifier(jwt);
});
