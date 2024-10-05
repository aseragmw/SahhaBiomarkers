import 'package:dartz/dartz.dart';
import 'package:sahha_app/features/scores/domain/entities/score_entity.dart';
import 'package:sahha_app/features/scores/domain/repo/scores_repo.dart';
import 'package:sahha_flutter/sahha_flutter.dart';

class GetScoresUseCase{
  final ScoresRepo repo;

  GetScoresUseCase(this.repo);

  Future<Either<List<ScoreEntity>,Unit>> invoke(List<SahhaScoreType> scores)async{
    return await repo.getScores(scores);
  }
}