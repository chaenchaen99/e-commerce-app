import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/constant/app_colors.dart';
import '../../../../../core/theme/custom/custom_font_weight.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../domain/model/display/menu/menu.model.dart';
import '../../bloc/menu_bloc/menu_bloc.dart';

class GlobalNavigationBar extends StatelessWidget {
  const GlobalNavigationBar(this.menus, {super.key});

  final List<Menu> menus;

  @override
  Widget build(BuildContext context) {
    final textScheme = Theme.of(context).textTheme;

    return BlocBuilder<MenuBloc, MenuState>(builder: (context, state) {
      return Stack(
        children: [
          TabBar(
            tabs: List.generate(
              menus.length,
              (index) => Tab(
                text: menus[index].title,
              ),
            ),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.symmetric(horizontal: 8),
            labelStyle: textScheme.titleSmall.semiBold,
            unselectedLabelStyle: textScheme.titleSmall,
            unselectedLabelColor: AppColors.contentSecondary,
          ),
          if (state.status == Status.loading)
            Positioned.fill(
              child: ColoredBox(
                color: Colors.black.withOpacity(0.1),
                child: Center(
                  child: Transform.scale(
                    scale: 0.5,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}
