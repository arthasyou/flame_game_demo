import 'package:flutter_riverpod/flutter_riverpod.dart';

final jwtProvider = StateProvider<String>((ref) {
  // 在这里获取或生成 JWT
  // 例如，从安全存储中读取或从 API 登录获取
  return "your-jwt-token";
});

// // 获取 JWT
// final jwt = ref.read(jwtProvider).state;

// // 修改 JWT
// context.ref(jwtProvider).state = "new-jwt-token";
