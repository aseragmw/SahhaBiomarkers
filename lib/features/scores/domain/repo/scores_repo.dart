import 'package:dartz/dartz.dart';
import 'package:sahha_app/features/scores/domain/entities/score_entity.dart';
import 'package:sahha_flutter/sahha_flutter.dart';


abstract class ScoresRepo{
  Future<Either<List<ScoreEntity>,Unit>> getScores(List<SahhaScoreType>scores);
}