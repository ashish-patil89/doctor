import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:orb_mobile/home/login.dart';

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
        child: Center(
          child: Text(
            'Home',
            style: AppTextStyles.bodyText1,
          ),
        ),
      ),
    );
  }
}
