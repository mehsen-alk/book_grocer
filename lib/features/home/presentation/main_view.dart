import 'package:book_grocer/config/app_localizations.dart';
import 'package:book_grocer/features/home/presentation/pages/settings/setting_view.dart';
import 'package:flutter/material.dart';

import '../../../config/color_manager.dart';
import '../../../config/strings_manager.dart';
import 'pages/home/home_view.dart';
import 'pages/search/search_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    const HomeView(),
    const SearchView(),
    const SettingsView()
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.grey,
        currentIndex: _currentPage,
        onTap: onTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: AppStrings.home.tr(context)),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search), label: AppStrings.search.tr(context)),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: AppStrings.settings.tr(context)),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: AppStrings.shoppingCart.tr(context)),
        ],
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}
