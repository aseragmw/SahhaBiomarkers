import 'package:dartz/dartz.dart';
import 'package:sahha_app/features/scores/data/data_sources/remote/scores_remote_data_source.dart';
import 'package:sahha_app/features/scores/domain/entities/biomarker_entity.dart';
import 'package:sahha_app/features/scores/domain/entities/score_entity.dart';
import 'package:sahha_app/features/scores/domain/repo/scores_repo.dart';
import 'package:sahha_flutter/sahha_flutter.dart';

class ScoresRepoImpl extends ScoresRepo {
  final ScoresRemoteDataSource dataSource;

  ScoresRepoImpl(this.dataSource);


  @override
  Future<Either<List<ScoreEntity>, Unit>> getScores(
      List<SahhaScoreType> scores) async {
    try {
      final value = await dataSource.getScores(scores);
      return Left(value);
    } catch (e) {
      return Future.value(Right(unit));
    }
  }
}
