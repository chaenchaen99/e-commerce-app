import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/constant/app_colors.dart';
import '../../../../../core/theme/constant/app_icons.dart';
import '../../../../../core/theme/custom/custom_app_bar.dart';
import '../../../../../core/theme/custom/custom_font_weight.dart';
import '../../cubit/mall_type_cubit.dart';
import '../widgets/svg_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(builder: (_, state) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        color: state.theme.backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        child: AppBar(
            leading: SvgIconButton(
              icon: AppIcons.mainLogo,
              padding: 8,
              color: state.theme.logoColor,
            ),
            title: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(CustomAppBarTheme.tabBarRadius),
                ),
                color: state.theme.containerColor,
              ),
              child: SizedBox(
                height: 28,
                width: 144,
                child: DefaultTabController(
                  initialIndex: state.index,
                  length: MallType.values.length,
                  child: TabBar(
                    onTap: (index) =>
                        context.read<MallTypeCubit>().changeIndex(index),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelPadding: EdgeInsets.only(left: 12, right: 12, top: 4),
                    labelColor: state.theme.labelColor,
                    dividerColor: Colors.transparent,
                    labelStyle: Theme.of(context).textTheme.labelLarge.bold,
                    unselectedLabelColor: state.theme.unselectedLabelColor,
                    unselectedLabelStyle:
                        Theme.of(context).textTheme.labelLarge,
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(CustomAppBarTheme.tabBarRadius),
                      ),
                      color: state.theme.indicatorColor,
                    ),
                    tabs: List.generate(
                      MallType.values.length,
                      (index) => Tab(
                        text: MallType.values[index].toName,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              SvgIconButton(
                icon: AppIcons.location,
                color: state.theme.iconColor,
              ),
              SvgIconButton(
                icon: AppIcons.cart,
                color: state.theme.iconColor,
              ),
            ],
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leadingWidth: 86),
      );
    });
  }
}
