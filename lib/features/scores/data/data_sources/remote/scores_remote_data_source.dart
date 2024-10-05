import 'package:sahha_flutter/sahha_flutter.dart';

import '../../../domain/entities/score_entity.dart';

abstract class ScoresRemoteDataSource{
  Future<List<ScoreEntity>> getScores(List<SahhaScoreType>scores);
}