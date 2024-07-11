import 'package:app_ui/app_ui.dart';
import 'package:doctor/home/login.dart';
import 'package:doctor/l10n/l10n.dart';
import 'package:doctor/router/app_router.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  static const appBarHeight = 42.0 +
      AppConstants.appBarButtonsTopPadding +
      AppConstants.appBarButtonsBottomPadding;

  @override
  State<HomeView> createState() => _FeedViewState();
}

class _FeedViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: HomeBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AppButton.fullWidth(
            buttonColor: AppColors.primaryOrange,
            onPressed: () async {
              AppRouter.of(context).push(
                SetScheduleRoute(),
              );
            },
            child: Text(context.l10n.setSchedule),
          ),
        ),
      ),
    );
  }
}
