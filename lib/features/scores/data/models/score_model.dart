
import 'dart:developer';

import '../../../../core/constants/api_constants.dart';
import 'biomarker_model.dart';

class ScoreModel {
  final String? id;
  final String? type;
  final String? state;
  final double? score;
  final List<BiomarkerModel>? factors;
  final List<String>? dataSources;
  final DateTime? scoreDateTime;
  final DateTime? createdAtUtc;
  final int? version;

  ScoreModel(this.id, this.type, this.state, this.score, this.factors,
      this.dataSources, this.scoreDateTime, this.createdAtUtc, this.version);

  factory ScoreModel.fromMap(Map<String, dynamic> map) {
    List<BiomarkerModel> biomarkers = [];
    if (map[factorsKey] != null && map[factorsKey] is List) {
      for (dynamic factor in map[factorsKey]) {
        biomarkers.add(BiomarkerModel.fromMap(factor));
      }
    }

    List<String> dataSources = [];
    if (map[dataSourcesKey] != null && map[dataSourcesKey] is List) {
      for (dynamic dataSource in map[dataSourcesKey]) {
        dataSources.add(dataSource.toString());
      }
    }

    DateTime? scoreDateTime;
    DateTime? createdAtUtc;

    try {
      scoreDateTime = map[scoreDateTimeKey] != null
          ? DateTime.parse(map[scoreDateTimeKey])
          : null;
    } catch (e) {
      log('Error parsing scoreDateTime: $e');
      scoreDateTime = null;
    }

    try {
      createdAtUtc = map[createdAtUtcKey] != null
          ? DateTime.parse(map[createdAtUtcKey])
          : null;
    } catch (e) {
      log('Error parsing createdAtUtc: $e');
      createdAtUtc = null;
    }

    return ScoreModel(
      map[idKey]?.toString() ?? '',
      map[typeKey]?.toString() ?? '',
      map[stateKey]?.toString() ?? '',
      (map[scoreKey] != null) ? map[scoreKey].toDouble() : null,
      biomarkers,
      dataSources,
      scoreDateTime,
      createdAtUtc,
      map[versionKey] != null ? map[versionKey] as int : 1,
    );
  }
}
