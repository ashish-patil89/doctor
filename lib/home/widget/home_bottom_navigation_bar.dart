import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationBarView();
  }
}

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({
    super.key,
  });

  static const appBarHeight = 42.0 +
      AppConstants.appBarButtonsTopPadding +
      AppConstants.appBarButtonsBottomPadding;

  @override
  State<BottomNavigationBarView> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarView> {
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
    return BottomNavigationBar(
      selectedFontSize: 20,
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryGreen,
        size: 40,
      ),
      selectedItemColor: AppColors.primaryGreen,
      selectedLabelStyle: AppTextStyles.bodyText2Bold,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Assets.icons.calendar.svg(),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(
          icon: Assets.icons.people.svg(),
          label: 'Patient',
        ),
        BottomNavigationBarItem(
          icon: Assets.icons.people.svg(),
          label: 'Profile',
        ),
      ],
    );
  }
}
