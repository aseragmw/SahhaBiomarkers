import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sahha_app/core/extentions/screen_size.dart';
import 'package:sahha_app/core/extentions/string_extensions.dart';
import 'package:sahha_app/features/scores/domain/entities/score_entity.dart';
import 'package:sahha_app/features/scores/presentation/widgets/biomarker_widget.dart';

import '../../../../core/utils/app_theme.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/main_layout.dart';

class BiomarkersScreen extends StatelessWidget {
  const BiomarkersScreen({super.key, required this.score});

  final ScoreEntity score;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        singleChild: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppTheme.primaryBlueColor,
                size: context.screenAspectRatio * 15,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: context.screenAspectRatio * 2,
            ),
            Center(
              child: Text(
                "${score.type}Biomarkers",
                style: TextStyle(
                    fontWeight: AppTheme.fontWeight500,
                    fontSize: AppTheme.fontSize22(context),
                    color: AppTheme.blackColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: context.screenAspectRatio * 5,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: score.biomarkers.length,
                itemBuilder: (context, index) {
                  final biomarker = score.biomarkers[index];
                  return biomarker.score!=0?BiomarkerWiget(biomarker: biomarker):SizedBox();
                })
          ],
        ));
  }
}
