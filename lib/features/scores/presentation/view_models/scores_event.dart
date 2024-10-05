
import 'package:sahha_flutter/sahha_flutter.dart';


sealed class ScoresEvent {
  const ScoresEvent();
}

class GetScoresEvent extends ScoresEvent {
  final List<SahhaScoreType> scores;

  GetScoresEvent(this.scores);
}