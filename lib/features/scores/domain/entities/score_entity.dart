import 'package:sahha_app/features/scores/domain/entities/biomarker_entity.dart';

class ScoreEntity {
  final String id;
  final String type;
  final String state;
  final double score;
  final List<BiomarkerEntity> biomarkers;
  final List<String> dataSources;

  ScoreEntity(this.id, this.type, this.state, this.score, this.biomarkers,
      this.dataSources);
}
