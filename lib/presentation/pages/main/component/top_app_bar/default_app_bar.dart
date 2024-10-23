import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/constant/app_colors.dart';
import '../../cubit/bottom_nav_cubit.dart';
import '../../cubit/mall_type_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  final BottomNav bottomnav;

  const DefaultAppBar(this.bottomnav, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(builder: (_, state) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        color: (state.isMarket) ? AppColors.primary : AppColors.background,
        child: AppBar(
          title: Text(
            bottomnav.toName,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: state.isMarket
                    ? AppColors.background
                    : AppColors.contentPrimary),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
      );
    });
  }
}
