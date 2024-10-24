import 'package:flutter/material.dart';
import '../../../../../domain/model/display/menu/menu.model.dart';
import '../../../main/cubit/mall_type_cubit.dart';

class GlobalNavigationBarView extends StatelessWidget {
  const GlobalNavigationBarView(this.mallType, this.menus, {super.key});

  final List<Menu> menus;
  final MallType mallType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: List.generate(
          menus.length,
          (index) => Column(
            children: [
              Text('mallType: ${mallType}'),
              Text('mallType: ${menus[index].title}'),
            ],
          ),
        ),
      ),
    );
  }
}
