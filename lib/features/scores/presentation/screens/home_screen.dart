import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahha_app/core/widgets/custom_app_bar.dart';
import 'package:sahha_app/core/widgets/main_layout.dart';
import 'package:sahha_app/features/scores/presentation/widgets/score_widget.dart';
import '../../../../core/utils/app_theme.dart';
import '../../domain/entities/score_entity.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.scores});
  final List<ScoreEntity>scores;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        singleChild: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: Text(
                "Sahha Scores",
                style: TextStyle(
                    fontWeight: AppTheme.fontWeight500,
                    fontSize: AppTheme.fontSize24(context),
                    color: AppTheme.blackColor),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: scores.length,
                itemBuilder: (context, index) {
                  final score = scores[index];
                  return ScoreWiget(score: score);
                })
          ],
        ));
  }
}
