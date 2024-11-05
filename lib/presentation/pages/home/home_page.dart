import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/dialog/common_dialog.dart';
import '../../../dependency_injection.dart';
import '../main/bloc/cubit/mall_type_cubit.dart';
import 'bloc/menu_bloc/menu_bloc.dart';
import 'component/global_navigation/global_navigation_bar.dart';
import 'component/global_navigation/global_navigation_bar_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(builder: (context, state) {
      return BlocProvider(
        create: (_) => getIt<MenuBloc>()
          ..add(
            MenuInitialized(state),
          ),
        child: HomePageView(),
      );
    });
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MallTypeCubit, MallType>(
      listener: (context, state) =>
          context.read<MenuBloc>().add(MenuInitialized(state)),
      listenWhen: (prev, curr) => prev.index != curr.index,
      child: BlocConsumer<MenuBloc, MenuState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
            case Status.loading:
              return DefaultTabController(
                key: ValueKey<MallType>(state.mallType),
                length: state.menus.length,
                child: Column(
                  children: [
                    GlobalNavigationBar(state.menus),
                    GlobalNavigationBarView(state.mallType, state.menus),
                  ],
                ),
              );
            case Status.success:
              return DefaultTabController(
                length: state.menus.length,
                key: ValueKey<MallType>(state.mallType),
                child: Column(
                  children: [
                    GlobalNavigationBar(state.menus),
                    GlobalNavigationBarView(state.mallType, state.menus),
                  ],
                ),
              );
            case Status.error:
              return Center(child: Text('error'));
          }
        },
        listener: (context, state) async {
          if (state.status == Status.error) {
            final bool result =
                (await CommonDialog.errorDialog(context, state.error) ?? false);
            if (result) {
              context.read<MenuBloc>().add(MenuInitialized(MallType.market));
            }
          }
        },
        listenWhen: (prev, curr) => prev.status != curr.status,
      ),
    );
  }
}
