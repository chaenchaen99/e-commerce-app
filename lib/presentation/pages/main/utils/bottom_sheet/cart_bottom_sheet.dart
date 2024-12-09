import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/snack_bar/common_snack_bar.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../cart_list/bloc/cart_list_bloc/cart_list_bloc.dart';
import 'widgets/add_cart_btn.dart';
import 'widgets/cart_price_info.dart';
import 'widgets/cart_product_info.dart';

Future<bool?> cartBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (_) {
      return SafeArea(
        child: BlocListener<CartListBloc, CartListState>(
          listener: (context, state) {
            if (state.status.isError) {
              CommonSnackBar.errorSnackBar(context, error: state.error);
            }
            if (context.canPop()) {
              //현재 화면이 네비게이션 스택에 쌓여있는 상태인지
              context.pop(!state.status.isError); //네비게이션 스택에서 현재화면 제거
            }
          },
          listenWhen: (previous, current) =>
              previous.status != current.status && !current.status.isLoading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CartProductInfo(),
                Divider(height: 1, thickness: 1),
                CartPriceInfo(),
                AddCartBtn(),
              ],
            ),
          ),
        ),
      );
    },
    showDragHandle: true,
  );
}
