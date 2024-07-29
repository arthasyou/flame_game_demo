import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  if (arguments.length != 3 || arguments[1] != '--out') {
    print(
        'Usage: dart generate_model_from_json.dart <input_directory> --out <output_directory>');
    return;
  }

  final inputDirectoryPath = arguments[0];
  final outputDirectoryPath = arguments[2];

  final inputDirectory = Directory(inputDirectoryPath);
  final outputDirectory = Directory(outputDirectoryPath);

  if (!inputDirectory.existsSync()) {
    print('The input directory does not exist.');
    return;
  }

  if (!outputDirectory.existsSync()) {
    outputDirectory.createSync(recursive: true);
  }

  final jsonFiles = inputDirectory
      .listSync(recursive: true)
      .where((file) => file.path.endsWith('.json'))
      .toList();

  if (jsonFiles.isEmpty) {
    print('No JSON files found in the input directory.');
    return;
  }

  for (var jsonFile in jsonFiles) {
    final jsonContent = File(jsonFile.path).readAsStringSync();
    final Map<String, dynamic> jsonMap = jsonDecode(jsonContent);
    final fileName =
        "${jsonFile.uri.pathSegments.last.split('.').first}_config_model";
    final modelName = _capitalize(_snakeToCamel(fileName));
    final dartCode = generateModelClass(modelName, jsonMap);
    final outputFilePath = '${outputDirectory.path}/$fileName.dart';
    File(outputFilePath).writeAsStringSync(dartCode);
    print('Generated model for ${jsonFile.path} at $outputFilePath');
  }
}

String generateModelClass(String modelName, Map<String, dynamic> jsonMap) {
  final className = _capitalize(modelName);
  final buffer = StringBuffer();

  if (jsonMap.values.first is List) {
    final listClassName = '${className}List';
    final elementType = _capitalize(className);

    buffer.writeln('class $listClassName {');
    buffer.writeln('  final List<$elementType> ${modelName.toLowerCase()};');
    buffer.writeln('\n  $listClassName({');
    buffer.writeln('    required this.${modelName.toLowerCase()},');
    buffer.writeln('  });');
    buffer.writeln(
        '\n  factory $listClassName.fromJson(Map<String, dynamic> json) {');
    buffer.writeln('    return $listClassName(');
    buffer.writeln(
        '      ${modelName.toLowerCase()}: List<$elementType>.from(json[\'${modelName.toLowerCase()}\'].map((e) => $elementType.fromJson(e))),');
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln('\n  Map<String, dynamic> toJson() {');
    buffer.writeln('    return {');
    buffer.writeln(
        '      \'${modelName.toLowerCase()}\': ${modelName.toLowerCase()}.map((e) => e.toJson()).toList(),');
    buffer.writeln('    };');
    buffer.writeln('  }');
    buffer.writeln('}');

    buffer.writeln(generateModelClass(elementType, jsonMap.values.first.first));
  } else {
    buffer.writeln('class $className {');

    jsonMap.forEach((key, value) {
      final fieldType = _getFieldType(value, _capitalize(key));
      final fieldName = key;
      buffer.writeln('  final $fieldType $fieldName;');
    });

    buffer.writeln('\n  $className({');
    jsonMap.forEach((key, value) {
      final fieldName = key;
      buffer.writeln('    required this.$fieldName,');
    });
    buffer.writeln('  });');

    buffer.writeln(
        '\n  factory $className.fromJson(Map<String, dynamic> json) {');
    buffer.writeln('    return $className(');
    jsonMap.forEach((key, value) {
      final fieldType = _getFieldType(value, _capitalize(key));
      final fieldName = key;
      if (fieldType.startsWith('List<')) {
        buffer.writeln('      $fieldName: List.from(json[\'$fieldName\']),');
      } else if (fieldType.contains('>')) {
        buffer.writeln(
            '      $fieldName: ${fieldType.substring(0, fieldType.indexOf('<'))}.fromJson(json[\'$fieldName\']),');
      } else {
        buffer.writeln('      $fieldName: json[\'$fieldName\'],');
      }
    });
    buffer.writeln('    );');
    buffer.writeln('  }');

    buffer.writeln('\n  Map<String, dynamic> toJson() {');
    buffer.writeln('    return {');
    jsonMap.forEach((key, value) {
      final fieldName = key;
      if (_getFieldType(value, _capitalize(key)).startsWith('List<')) {
        buffer.writeln('      \'$fieldName\': $fieldName,');
      } else if (_getFieldType(value, _capitalize(key)).contains('>')) {
        buffer.writeln('      \'$fieldName\': $fieldName.toJson(),');
      } else {
        buffer.writeln('      \'$fieldName\': $fieldName,');
      }
    });
    buffer.writeln('    };');
    buffer.writeln('  }');

    buffer.writeln('}');
  }

  return buffer.toString();
}

String _getFieldType(dynamic value, String className) {
  if (value is int) {
    return 'int';
  } else if (value is double) {
    return 'double';
  } else if (value is bool) {
    return 'bool';
  } else if (value is String) {
    return 'String';
  } else if (value is List) {
    if (value.isNotEmpty && value.first is Map) {
      return 'List<$className>';
    } else {
      return 'List<dynamic>';
    }
  } else if (value is Map) {
    return className;
  } else {
    return 'dynamic';
  }
}

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String _snakeToCamel(String snake) {
  return snake.split('_').map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join('');
}
