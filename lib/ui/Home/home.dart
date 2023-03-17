// ignore_for_file: constant_identifier_names

import 'package:coreapp1/ui/facilities/facilites_screen.dart';
import 'package:coreapp1/ui/profile/profile_screen.dart';
import 'package:coreapp1/ui/setting/settings_screen.dart';
import 'package:coreapp1/utils/style/style_constants/color_constants.dart';
import 'package:flutter/material.dart';

enum AppScreen { FACILITIES, PROFILE, SETTINGS }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppScreen _selectedScreen = AppScreen.FACILITIES;

  void _onItemTapped(AppScreen screen) {
    setState(() {
      _selectedScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.kSecondaryColorAccent,
        body: Stack(
          children: [
            buildHomeScreenBody(),
            buildNavigationBar(),
          ],
        ));
  }

  buildHomeScreenBody() {
    switch (_selectedScreen) {
      case AppScreen.FACILITIES:
        return FacilitiesScreen();
      case AppScreen.PROFILE:
        return const ProfileScreen();
      case AppScreen.SETTINGS:
        return const SettingsScreen();
    }
  }

  buildNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: const ShapeDecoration(
            color: ColorConstants.kPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildNavigationIcon(
                  appScreen: AppScreen.FACILITIES, iconData: Icons.home_filled),
              buildNavigationIcon(
                  appScreen: AppScreen.PROFILE, iconData: Icons.person_rounded),
              buildNavigationIcon(
                  appScreen: AppScreen.SETTINGS,
                  iconData: Icons.settings_rounded),
            ],
          ),
        ),
      ),
    );
  }

  buildNavigationIcon(
      {required IconData iconData, required AppScreen appScreen}) {
    return CircleAvatar(
      backgroundColor: appScreen == _selectedScreen
          ? ColorConstants.kSecondaryColor
          : ColorConstants.kPrimaryColor,
      child: IconButton(
          splashColor: Colors.transparent,
          onPressed: () => _onItemTapped(appScreen),
          icon: Icon(
            iconData,
            color: Colors.white,
          )),
    );
  }
}
