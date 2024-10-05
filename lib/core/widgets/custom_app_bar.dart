import 'package:flutter/material.dart';
import 'package:sahha_app/core/extentions/screen_size.dart';
import '../utils/app_theme.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? title;
  final bool? showBackCursor;
  final Widget? trailingWidget;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBackCursor,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.screenAspectRatio * 5,
        horizontal: context.screenAspectRatio * 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showBackCursor != null && showBackCursor == true)
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppTheme.primaryBlueColor,
                size: context.screenAspectRatio * 15,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          else
            SizedBox(width: context.screenAspectRatio * 15), // Placeholder for alignment

          // Title centered
          Expanded(
            child: Center(
              child: title ?? SizedBox.shrink(),
            ),
          ),

          // Trailing widget
          trailingWidget ?? SizedBox(width: context.screenAspectRatio * 10), // Placeholder for alignment
        ],
      ),
    );
  }
}
