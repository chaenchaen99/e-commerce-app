import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/snack_bar/common_snack_bar.dart';
import '../../../core/theme/constant/app_colors.dart';
import '../../../core/theme/constant/app_icons.dart';
import 'utils/bottom_sheet/cart_bottom_sheet.dart';
import '../category/category_page.dart';
import '../home/home_page.dart';
import '../search/search_page.dart';
import '../user/user_page.dart';
import 'bloc/cart_bloc/cart_bloc.dart';
import 'component/top_app_bar/top_app_bar.dart';
import 'bloc/cubit/bottom_nav_cubit.dart';
import 'bloc/cubit/mall_type_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => BottomNavCubit()),
      BlocProvider(create: (_) => MallTypeCubit()),
    ], child: MainPageView());
  }
}

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: BlocListener<CartBloc, CartState>(
        listener: (_, state) async {
          final bottomSheet = await cartBottomSheet(context)
              .whenComplete(() => context.read<CartBloc>().add(CartClosed()));

          final bool isSuccess = bottomSheet ?? false;
          if (isSuccess) {
            CommonSnackBar.addCartSnackBar(context);
          }
        },
        listenWhen: (previous, current) =>
            previous.status.isClose && current.status.isOpen,
        child: BlocBuilder<BottomNavCubit, BottomNav>(
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
