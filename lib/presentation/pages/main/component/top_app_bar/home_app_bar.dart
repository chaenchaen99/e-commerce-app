import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/constant/app_colors.dart';
import '../../../../../core/theme/constant/app_icons.dart';
import '../../cubit/mall_type_cubit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(builder: (_, state) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        color: (state.isMarket) ? AppColors.primary : AppColors.background,
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        child: AppBar(
            // backgroundColor: Colors.amber,
            leading: Padding(
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset(
                AppIcons.mainLogo,
                colorFilter: ColorFilter.mode(
                  state.isMarket ? AppColors.onPrimary : AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            title: DefaultTabController(
              initialIndex: state.index,
              length: MallType.values.length,
              child: TabBar(
                onTap: (index) =>
                    context.read<MallTypeCubit>().changeIndex(index),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                tabs: List.generate(
                  MallType.values.length,
                  (index) => Tab(
                    text: MallType.values[index].toName,
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  AppIcons.location,
                  colorFilter: ColorFilter.mode(
                    state.isMarket
                        ? AppColors.background
                        : AppColors.contentPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  AppIcons.cart,
                  colorFilter: ColorFilter.mode(
                    state.isMarket
                        ? AppColors.background
                        : AppColors.contentPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              )
            ],
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leadingWidth: 86),
      );
    });
  }
}
