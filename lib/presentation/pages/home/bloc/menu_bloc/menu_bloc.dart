import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/error/error_response.dart';
import '../../../../../core/utils/exception/common_exception.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../../domain/model/common/result.dart';
import '../../../../../domain/model/display/menu/menu.model.dart';
import '../../../../../domain/usecase/display/display.usecase.dart';
import '../../../../../domain/usecase/display/menu/get_menus.usecase.dart';
import '../../../main/bloc/cubit/mall_type_cubit.dart';

part 'menu_event.dart';
part 'menu_state.dart';

part 'menu_bloc.freezed.dart';

@injectable
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final DisplayUsecase _displayUsecase;

  MenuBloc(this._displayUsecase) : super(MenuState()) {
    on<MenuInitialized>(_onMenuInitialized);
  }

  Future<void> _onMenuInitialized(
      MenuInitialized event, Emitter<MenuState> emit) async {
    final mallType = event.mallType;

    emit(state.copyWith(status: Status.loading));
    await Future.delayed(Duration(seconds: 2));

    try {
      final response = await _fetch(mallType);
      response.when(success: (menus) {
        emit(state.copyWith(
          status: Status.success,
          menus: menus,
          mallType: mallType,
        ));
      }, failure: (error) {
        emit(state.copyWith(
          status: Status.error,
          error: error,
        ));
      });
    } catch (e) {
      CustomLogger.logger.e(e);
      emit(state.copyWith(
          status: Status.error, error: CommonException.setError(e)));
    }
  }

  Future<Result<List<Menu>>> _fetch(MallType mallType) async {
    return await _displayUsecase.execute(usecase: GetMenusUsecase(mallType));
  }
}
