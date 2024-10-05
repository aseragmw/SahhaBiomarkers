import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahha_app/core/extentions/screen_size.dart';
import '../utils/app_theme.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.body,
    this.bottomNavBar,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.singleChild,
    this.bgColor,
    this.bgUrl,
  });

  final Widget body;
  final Widget? bottomNavBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final bool? singleChild;
  final Color? bgColor;
  final String? bgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: floatingActionButtonLocation ??
          FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavBar,
      floatingActionButton: floatingActionButton,
      backgroundColor: bgColor ?? AppTheme.whiteColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SizedBox(
            height: context.screenHeight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                context.screenWidth * 0.05,
                context.screenWidth * 0.04,
                context.screenWidth * 0.05,
                0,
              ),
              child:singleChild == true ? SingleChildScrollView(child: body) : body,
            ),
          ),
        ),
      ),
    );
  }
}
