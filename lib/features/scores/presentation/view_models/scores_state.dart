
import 'package:sahha_app/features/scores/domain/entities/biomarker_entity.dart';
import 'package:sahha_app/features/scores/domain/entities/score_entity.dart';

sealed class ScoresState  {
  const ScoresState();

}

final class ScoresInitial extends ScoresState {}

class GetBiomarkersLoadingState extends ScoresState {}

class GetBiomarkersSuccessState extends ScoresState {
  final List<BiomarkerEntity> biomarkers;

  const GetBiomarkersSuccessState({required this.biomarkers});
}

class GetBiomarkersErrorState extends ScoresState {
  final String message;

  const GetBiomarkersErrorState({required this.message});
}

class GetScoresLoadingState extends ScoresState {}

class GetScoresSuccessState extends ScoresState {
  final List<ScoreEntity> scores;

  const GetScoresSuccessState({required this.scores});
}

class GetScoresErrorState extends ScoresState {
  final String message;

  const GetScoresErrorState({required this.message});
}
