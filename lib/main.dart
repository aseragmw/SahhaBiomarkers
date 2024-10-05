import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahha_app/features/scores/data/data_sources/remote/scores_remote_data_source_with_sahha.dart';
import 'package:sahha_app/features/scores/data/repo_impl/scores_repo_impl.dart';
import 'package:sahha_app/features/scores/domain/entities/score_entity.dart';
import 'package:sahha_app/features/scores/domain/usecases/get_scores_usecase.dart';
import 'package:sahha_app/features/scores/presentation/screens/home_screen.dart';
import 'package:sahha_app/features/scores/presentation/screens/splash_screen.dart';
import 'package:sahha_app/features/scores/presentation/view_models/scores_bloc.dart';

import 'package:sahha_flutter/sahha_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ScoresBloc>(
            create: (context) => ScoresBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Sahha Biomarkers',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "SpaceGrotesk",
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:  SplashScreen(),
        ));
  }
}
