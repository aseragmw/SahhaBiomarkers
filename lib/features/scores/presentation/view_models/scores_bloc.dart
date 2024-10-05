import 'package:bloc/bloc.dart';
import 'package:sahha_app/features/scores/data/data_sources/remote/scores_remote_data_source_with_sahha.dart';
import 'package:sahha_app/features/scores/data/repo_impl/scores_repo_impl.dart';
import 'package:sahha_app/features/scores/domain/usecases/get_scores_usecase.dart';
import 'package:sahha_app/features/scores/presentation/view_models/scores_event.dart';
import 'package:sahha_app/features/scores/presentation/view_models/scores_state.dart';

class ScoresBloc extends Bloc<ScoresEvent, ScoresState> {
  final GetScoresUseCase getScoresUseCase = GetScoresUseCase(
      ScoresRepoImpl(ScoresRemoteDataSourceWithSahha()));


  ScoresBloc() : super(ScoresInitial()) {

    on<GetScoresEvent>((event, emit) async {
      emit(GetScoresLoadingState());

      final either = await getScoresUseCase.invoke(event.scores);
      either.fold(
            (left) => emit(GetScoresSuccessState(scores: left)),
            (right) => emit(GetScoresErrorState(message:"Error Getting Scores")),
      );
    });
  }
}