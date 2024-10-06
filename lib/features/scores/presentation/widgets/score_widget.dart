import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sahha_app/core/extentions/screen_size.dart';
import 'package:sahha_app/core/extentions/string_extensions.dart';
import 'package:sahha_app/features/scores/domain/entities/score_entity.dart';
import 'package:sahha_app/features/scores/presentation/screens/biomarkers_screen.dart';

import '../../../../core/utils/app_theme.dart';

class ScoreWiget extends StatelessWidget {
  const ScoreWiget({super.key, required this.score});
  final ScoreEntity score;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: context.screenAspectRatio * 2),
        height: context.screenWidth * 0.7,
        width: context.screenWidth,
        decoration: BoxDecoration(
            color: AppTheme.primaryBlueColor.withOpacity(0.4),
            borderRadius: AppTheme.boxRadius),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.screenAspectRatio * 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    score.type,
                    style: TextStyle(
                        fontWeight: AppTheme.fontWeight500,
                        fontSize: AppTheme.fontSize20(context),
                        color: AppTheme.blackColor),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppTheme.whiteColor,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BiomarkersScreen(score: score)));
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.screenAspectRatio * 5,
            ),
            CircularPercentIndicator(
              backgroundColor: AppTheme.whiteColor,
              radius: context.screenWidth * 0.2,
              lineWidth: 5.0,
              percent:score.score,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${score.score}%",
                    style: TextStyle(
                        fontWeight: AppTheme.fontWeight600,
                        fontSize: AppTheme.fontSize20(context),
                        color: AppTheme.blackColor),
                  ),
                  Text(
                    score.state,
                    style: TextStyle(
                        fontWeight: AppTheme.fontWeight400,
                        fontSize: AppTheme.fontSize14(context),
                        color: AppTheme.blackColor.withOpacity(0.6)),
                  )
                ],
              ),
              progressColor: AppTheme.primaryBlueColor,
            )
          ],
        ),
      ),
    );
  }
}
