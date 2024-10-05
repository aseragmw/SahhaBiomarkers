import 'package:sahha_app/core/constants/constant_values.dart';
import 'package:sahha_app/core/extentions/string_extensions.dart';
import 'package:sahha_app/features/scores/data/mappers/biomarker_mapper.dart';
import 'package:sahha_app/features/scores/data/models/score_model.dart';
import 'package:sahha_app/features/scores/domain/entities/score_entity.dart';

import '../../domain/entities/biomarker_entity.dart';

class ScoreMapper {
  static ScoreEntity fromModelToEntity(ScoreModel model) {
    List<BiomarkerEntity> biomarkers = [];
    for (dynamic factor in model.factors ?? []) {
      biomarkers.add(BiomarkerMapper.fromModelToEntity(factor));
    }
    List<String> dataSources = [];
    for (dynamic dataSource in model.dataSources ?? []) {
      dataSources.add(dataSource);
    }
    String type = "";
    if (model.type != null) {
      final typeList = model.type!.split("_");
      for (String word in typeList) {
        type += word.capitalize() + " ";
      }
    }

    return ScoreEntity(
        model.id ?? defaultStringValue,
        type,
        model.state ?? defaultStringValue,
        model.score ?? 0,
        biomarkers,
        dataSources);
  }
}
