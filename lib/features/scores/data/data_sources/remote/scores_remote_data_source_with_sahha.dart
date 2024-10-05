import 'dart:convert';

import 'package:sahha_app/features/scores/data/data_sources/remote/scores_remote_data_source.dart';
import 'package:sahha_app/features/scores/data/mappers/score_mapper.dart';
import 'package:sahha_app/features/scores/data/models/score_model.dart';
import 'package:sahha_app/features/scores/domain/entities/score_entity.dart';
import 'package:sahha_flutter/sahha_flutter.dart';

import '../../../../../core/constants/api_constants.dart';

class ScoresRemoteDataSourceWithSahha extends ScoresRemoteDataSource {


  @override
  Future<List<ScoreEntity>> getScores(List<SahhaScoreType> scores) async {
    await SahhaFlutter.configure(environment: SahhaEnvironment.sandbox);
    await SahhaFlutter.authenticate(
        appId: appId, appSecret: appSecret, externalId: externalId);
    await SahhaFlutter.enableSensors(SahhaFlutter.sensorList);
    final res = await SahhaFlutter.getScores(types: scores);

    List<dynamic> json = jsonDecode(res);

    Map<String, ScoreEntity> uniqueScoresMap = {};

    for (dynamic score in json) {
      final model = ScoreModel.fromMap(score);
      final entity = ScoreMapper.fromModelToEntity(model);

      if (!uniqueScoresMap.containsKey(entity.type)) {
        uniqueScoresMap[entity.type] = entity;
      }
    }

    return uniqueScoresMap.values.toList();
  }
}
