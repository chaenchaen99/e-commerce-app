import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/constant/app_colors.dart';
import '../../../core/theme/constant/app_icons.dart';
import '../category/category_page.dart';
import '../home/home_page.dart';
import '../search/search_page.dart';
import '../user/user_page.dart';
import 'cubit/bottom_nav_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: MainPageView(),
    );
  }
}

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44),
        child: Container(
          color: AppColors.primary,
          padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
          child: AppBar(
              leading: Padding(
                padding: EdgeInsets.all(8),
                child: SvgPicture.asset(AppIcons.mainLogo),
              ),
              title: Text(
                'tabBar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    AppIcons.location,
                    colorFilter:
                        ColorFilter.mode(AppColors.background, BlendMode.srcIn),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    AppIcons.cart,
                    colorFilter:
                        ColorFilter.mode(AppColors.background, BlendMode.srcIn),
                  ),
                )
              ],
              backgroundColor: AppColors.primary,
              centerTitle: true,
              leadingWidth: 86),
        ),
      ),
      body: BlocBuilder<BottomNavCubit, BottomNav>(
        builder: (_, state) {
          switch (state) {
            case BottomNav.home:
              return HomePage();
            case BottomNav.category:
              return CategoryPage();
            case BottomNav.search:
              return SearchPage();
            case BottomNav.user:
              return UserPage();
          }
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavCubit, BottomNav>(builder: (_, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          onTap: (index) => context.read<BottomNavCubit>().changeIndex(index),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: List.generate(
            BottomNav.values.length,
            (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset(BottomNav.values[index].icon),
              label: BottomNav.values[index].toName,
              activeIcon: SvgPicture.asset(BottomNav.values[index].activeIcon),
            ),
          ),
        );
      }),
    );
  }
}
