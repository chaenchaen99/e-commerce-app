import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../domain/model/display/menu/menu.model.dart';
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
            create: (_) => locator<ViewModuleBloc>()
              ..add(ViewModuleInitialized(menus[index].tabId)),
            child: ViewModuleList(),
          );
        }),
      ),
    );
  }
}

class ViewModuleList extends StatefulWidget {
  const ViewModuleList({super.key});

  @override
  State<ViewModuleList> createState() => _ViewModuleListState();
}

class _ViewModuleListState extends State<ViewModuleList> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isEnd) {
      context.read<ViewModuleBloc>().add(ViewModuleFetched());
    }
  }

  bool get _isEnd {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final curScroll = scrollController.offset;
    return curScroll >= maxScroll * 0.9;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewModuleBloc, ViewModuleState>(builder: (_, state) {
      return (state.status.isInitial || state.viewModules.isEmpty)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              controller: scrollController,
              children: [
                ...state.viewModules,
                if (state.status.isLoading) LoadingWidget(),
              ],
            );
    });
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
