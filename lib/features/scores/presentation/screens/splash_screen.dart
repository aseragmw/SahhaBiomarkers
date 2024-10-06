import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahha_app/core/widgets/main_layout.dart';
import 'package:sahha_app/features/scores/presentation/screens/home_screen.dart';
import 'package:sahha_flutter/sahha_flutter.dart';

import '../../../../core/utils/app_theme.dart';
import '../../../../core/utils/snackbar_message.dart';
import '../../domain/entities/score_entity.dart';
import '../view_models/scores_bloc.dart';
import '../view_models/scores_event.dart';
import '../view_models/scores_state.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<ScoreEntity> scores = [];

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    context.read<ScoresBloc>().add(GetScoresEvent(SahhaScoreType.values));
  }

  @override
  Widget build(BuildContext context) {

    return MainLayout(body:
    BlocConsumer<ScoresBloc, ScoresState>(builder: (context, state) {
      if (state is GetScoresLoadingState) {
        return Center(
            child: LinearProgressIndicator(
              color: AppTheme.primaryBlueColor,
            ));
      }
      return SizedBox();

    }, listener: (context, state) {
      if (state is GetScoresErrorState) {
        SnackBarMessage.showErrorSnackBar(
            message: state.message, context: context);
        setState(() {
          isLoading = false;
        });
      }
      if (state is GetScoresSuccessState) {
        scores = state.scores;
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>HomeScreen(scores: scores)), (route) => false);
      }
    })
    );
  }
}
