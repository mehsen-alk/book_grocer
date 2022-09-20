import 'package:book_grocer/features/home/presentation/pages/home/home_view.dart';
import 'package:book_grocer/features/home/presentation/pages/home/search_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../config/color_manager.dart';
import '../../../config/strings_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  List<Widget> pages = [
    HomeView(),
    const SearchView()
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentPage,
          onTap: onTap,
          items:   [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined), label: AppStrings.home.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search), label: AppStrings.search.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.list),
                label: AppStrings.wishList.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart), label: AppStrings.shopingCart.tr()),
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
