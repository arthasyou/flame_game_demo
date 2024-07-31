import 'dart:io';

void main() {
  final protoFiles = [
    'protos/message.proto', // 添加你的proto文件路径
    // 'path/to/another.proto',
  ];

  generateMessageList(protoFiles);
  generateProtoMappings(protoFiles);
}

void generateMessageList(List<String> protoFiles) {
  final buffer = StringBuffer();
  buffer.writeln('// generated_message_list.dart');
  buffer.writeln('// This file is auto-generated. Do not edit manually.');
  buffer.writeln("import 'package:protobuf/protobuf.dart';");
  buffer.writeln("import '../protos/message.pb.dart';"); // 导入生成的proto文件

  buffer.writeln('List<GeneratedMessage Function()> getAllMessageTypes() {');
  buffer.writeln('  return [');

  for (final protoFile in protoFiles) {
    final lines = File(protoFile).readAsLinesSync();
    for (final line in lines) {
      final match = RegExp(r'message (\w+)').firstMatch(line);
      if (match != null) {
        final messageName = match.group(1);
        buffer.writeln('    () => $messageName(),');
      }
    }
  }

  buffer.writeln('  ];');
  buffer.writeln('}');

  final outputFile = File('lib/gen/proto_list_generator.dart');
  outputFile.writeAsStringSync(buffer.toString());
  print('Generated file: proto_list_generator.dart');
}

void generateProtoMappings(List<String> protoFiles) {
  final cmdToNameBuffer = StringBuffer();
  final nameToCmdBuffer = StringBuffer();

  cmdToNameBuffer.writeln('// generated_proto_mapping.dart');
  cmdToNameBuffer
      .writeln('// This file is auto-generated. Do not edit manually.');
  cmdToNameBuffer.writeln('');
  cmdToNameBuffer.writeln('String cmdToName(int cmd) {');
  cmdToNameBuffer.writeln('  switch (cmd) {');

  nameToCmdBuffer.writeln('int nameToCmd(String name) {');
  nameToCmdBuffer.writeln('  switch (name) {');

  for (final protoFile in protoFiles) {
    final lines = File(protoFile).readAsLinesSync();
    String? packageName;
    String? tosName;
    String? tocName;
    for (final line in lines) {
      final packageMatch = RegExp(r'package (\w+);').firstMatch(line);
      if (packageMatch != null) {
        packageName = packageMatch.group(1);
      }

      final tosMatch = RegExp(r'// @tos_(\d+)').firstMatch(line);
      final tocMatch = RegExp(r'// @toc_(\d+)').firstMatch(line);
      final messageMatch = RegExp(r'message (\w+)').firstMatch(line);

      if (tosMatch != null) {
        tosName = tosMatch.group(1);
      }

      if (tocMatch != null) {
        tocName = tocMatch.group(1);
      }

      if (tosName != null && messageMatch != null) {
        final messageName = messageMatch.group(1);
        final fullMessageName =
            packageName != null ? '$packageName.$messageName' : messageName;
        nameToCmdBuffer
            .writeln('    case "$fullMessageName": return $tosName;');
        tosName = null;
      }

      if (tocName != null && messageMatch != null) {
        final messageName = messageMatch.group(1);
        final fullMessageName =
            packageName != null ? '$packageName.$messageName' : messageName;
        cmdToNameBuffer
            .writeln('    case $tocName: return "$fullMessageName";');
        tocName = null;
      }
    }
  }

  cmdToNameBuffer.writeln('    default: return "";');
  cmdToNameBuffer.writeln('  }');
  cmdToNameBuffer.writeln('}');

  nameToCmdBuffer.writeln('    default: return 0;');
  nameToCmdBuffer.writeln('  }');
  nameToCmdBuffer.writeln('}');

  final mappingFile = File('lib/gen/proto_mapping.dart');
  mappingFile.writeAsStringSync(cmdToNameBuffer.toString());
  mappingFile.writeAsStringSync('\n' + nameToCmdBuffer.toString(),
      mode: FileMode.append);

  print('Generated file: proto_mapping.dart');
}
