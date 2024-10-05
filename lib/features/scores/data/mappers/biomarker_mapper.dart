import 'package:sahha_app/core/constants/constant_values.dart';
import 'package:sahha_app/core/extentions/string_extensions.dart';
import 'package:sahha_app/features/scores/domain/entities/biomarker_entity.dart';

import '../models/biomarker_model.dart';

class BiomarkerMapper {
  static BiomarkerEntity fromModelToEntity(BiomarkerModel model) {
    String name = "";
    if (model.name != null) {
      final typeList = model.name!.split("_");
      for (String word in typeList) {
        name += word.capitalize() + " ";
      }
    }
    return BiomarkerEntity(
        model.id ?? defaultStringValue,
        name,
        model.value ?? defaultDoubleValue,
        model.goal ?? defaultDoubleValue,
        model.score ?? defaultDoubleValue,
        model.state ?? defaultStringValue,
        model.unit ?? defaultStringValue);
  }
}
