import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../domain/model/display/menu/menu.model.dart';
import '../../../../../domain/usecase/display/display.usecase.dart';
import '../../../../../service_locator.dart';
import '../../../main/cubit/mall_type_cubit.dart';
import '../../bloc/view_module_bloc/view_module_bloc.dart';

class GlobalNavigationBarView extends StatelessWidget {
  const GlobalNavigationBarView(this.mallType, this.menus, {super.key});

  final List<Menu> menus;
  final MallType mallType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: List.generate(menus.length, (index) {
          return BlocProvider(
            create: (_) => ViewModuleBloc(locator<DisplayUsecase>())
              ..add(ViewModuleInitialized(menus[index].tabId)),
            child: ViewModuleList(),
          );
        }),
      ),
    );
  }
}

class ViewModuleList extends StatelessWidget {
  const ViewModuleList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewModuleBloc, ViewModuleState>(builder: (_, state) {
      switch (state.status) {
        case Status.initial:
        case Status.loading:
          return Center(child: CircularProgressIndicator());
        case Status.success:
          return ListView.separated(
            itemBuilder: (_, index) => state.viewModules[index],
            separatorBuilder: (_, index) => Divider(thickness: 4),
            itemCount: state.viewModules.length,
          );
        case Status.error:
          return Center(
            child: Text('error'),
          );
      }
    });
  }
}
