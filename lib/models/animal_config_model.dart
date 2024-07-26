class MarineAnimalConfigModel {
  final String name;
  final int idleFrameAnimationAmount;
  final List<double> idleSize;
  final int deadFrameAnimationAmount;
  final List<double> deadSize;
  final int? idlePerRow;
  final int? deadPerRow;
  final double moveSpeed;

  MarineAnimalConfigModel({
    required this.name,
    required this.idleFrameAnimationAmount,
    required this.idleSize,
    required this.deadFrameAnimationAmount,
    required this.deadSize,
    this.idlePerRow,
    this.deadPerRow,
    required this.moveSpeed,
  });

  factory MarineAnimalConfigModel.fromJson(Map<String, dynamic> json) {
    return MarineAnimalConfigModel(
      name: json['name'],
      idleFrameAnimationAmount: json['idleFrameAnimationAmount'],
      idleSize: List<double>.from(json['idleSize']),
      idlePerRow: json['idlePerRow'],
      deadFrameAnimationAmount: json['deadFrameAnimationAmount'],
      deadSize: List<double>.from(json['deadSize']),
      deadPerRow: json['deadPerRow'],
      moveSpeed: json['moveSpeed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'idleFrameAnimationAmount': idleFrameAnimationAmount,
      'idleSize': idleSize,
      'idlePerRow': idlePerRow,
      'deadFrameAnimationAmount': deadFrameAnimationAmount,
      'deadSize': deadSize,
      'deadPerRow': deadPerRow,
      'moveSpeed': moveSpeed,
    };
  }
}

class MarineAnimalConfigModelList {
  final List<MarineAnimalConfigModel> marineAnimals;

  MarineAnimalConfigModelList({required this.marineAnimals});

  factory MarineAnimalConfigModelList.fromJson(Map<String, dynamic> json) {
    var list = json['marine_animals'] as List;
    List<MarineAnimalConfigModel> marineAnimalsList =
        list.map((i) => MarineAnimalConfigModel.fromJson(i)).toList();

    return MarineAnimalConfigModelList(marineAnimals: marineAnimalsList);
  }

  Map<String, dynamic> toJson() {
    return {
      'marine_animals': marineAnimals.map((animal) => animal.toJson()).toList(),
    };
  }
}
