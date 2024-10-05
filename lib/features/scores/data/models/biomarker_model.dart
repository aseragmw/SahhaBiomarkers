import '../../../../core/constants/api_constants.dart';

class BiomarkerModel {
  final String? id;
  final String? name;
  final double? value;
  final double? goal;
  final double? score;
  final String? state;
  final String? unit;

  BiomarkerModel(this.id, this.name, this.value, this.goal, this.score,
      this.state, this.unit);

  factory BiomarkerModel.fromMap(Map<String, dynamic> map) {
    return BiomarkerModel(
      map[idKey]?.toString() ?? '',
      map[nameKey]?.toString() ?? '',
      (map[valueKey] != null) ? map[valueKey].toDouble() : null,
      (map[goalKey] != null) ? map[goalKey].toDouble() : null,
      (map[scoreKey] != null) ? map[scoreKey].toDouble() : null,
      map[stateKey]?.toString() ?? '',
      map[unitKey]?.toString() ?? '',
    );
  }
}
