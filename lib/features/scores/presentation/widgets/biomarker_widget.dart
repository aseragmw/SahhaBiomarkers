import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sahha_app/core/extentions/screen_size.dart';
import 'package:sahha_app/core/extentions/string_extensions.dart';
import 'package:sahha_app/features/scores/domain/entities/biomarker_entity.dart';

import '../../../../core/utils/app_theme.dart';

class BiomarkerWiget extends StatelessWidget {
  const BiomarkerWiget({super.key, required this.biomarker});

  final BiomarkerEntity biomarker;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: context.screenAspectRatio * 2),
        height: context.screenWidth * 0.25,
        width: context.screenWidth,
        decoration: BoxDecoration(
            color: AppTheme.primaryBlueColor.withOpacity(0.4),
            borderRadius: AppTheme.boxRadius),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: context.screenAspectRatio * 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                biomarker.name,
                style: TextStyle(
                    fontWeight: AppTheme.fontWeight500,
                    fontSize: AppTheme.fontSize14(context),
                    color: AppTheme.blackColor),
              ),
              CircularPercentIndicator(
                backgroundColor: AppTheme.whiteColor,
                radius: context.screenWidth * 0.1,
                lineWidth: 5.0,
                percent: biomarker.score,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${biomarker.score}%",
                      style: TextStyle(
                          fontWeight: AppTheme.fontWeight600,
                          fontSize: AppTheme.fontSize14(context),
                          color: AppTheme.blackColor),
                    ),
                    Text(
                      biomarker.state.capitalize(),
                      style: TextStyle(
                          fontWeight: AppTheme.fontWeight400,
                          fontSize: AppTheme.fontSize10(context),
                          color: AppTheme.blackColor.withOpacity(0.6)),
                    )
                  ],
                ),
                progressColor: AppTheme.primaryBlueColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
