// generated_proto_mapping.dart
// This file is auto-generated. Do not edit manually.

String cmdToName(int cmd) {
  switch (cmd) {
    case 1001: return "ftproto.UserInfoResult";
    case 2001: return "ftproto.FruitPlayResult";
    case 2002: return "ftproto.BsPlayResult";
    case 2003: return "ftproto.CancelResult";
    default: return "";
  }
}

int nameToCmd(String name) {
  switch (name) {
    case "ftproto.UserInfoArg": return 1001;
    case "ftproto.FruitPlayArg": return 2001;
    case "ftproto.BsPlayArg": return 2002;
    case "ftproto.CancelArg": return 2003;
    default: return 0;
  }
}
