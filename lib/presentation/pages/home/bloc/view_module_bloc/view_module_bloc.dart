import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/error/error_response.dart';
import '../../../../../core/utils/exception/common_exception.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../../domain/model/common/result.dart';
import '../../../../../domain/model/display/view_module/view_module.model.dart';
import '../../../../../domain/usecase/display/display.usecase.dart';
import '../../../../../domain/usecase/display/view_module/get_view_modules.usecase.dart';

part 'view_module_event.dart';
part 'view_module_state.dart';

part 'view_module_bloc.freezed.dart';

class ViewModuleBloc extends Bloc<ViewModuleEvent, ViewModuleState> {
  final DisplayUsecase _displayUsecase;

  ViewModuleBloc(this._displayUsecase) : super(ViewModuleState()) {
    on<ViewModuleInitialized>(_onViewModuleInitialized);
  }

  Future<void> _onViewModuleInitialized(
      ViewModuleInitialized event, Emitter<ViewModuleState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final tabId = event.tabId;
    try {
      final response = await _fetch(tabId);
      response.when(success: (viewModules) {
        emit(state.copyWith(
            status: Status.success, tabId: tabId, viewModules: viewModules));
      }, failure: (error) {
        emit(state.copyWith(status: Status.error, error: error));
      });
    } catch (e) {
      CustomLogger.logger.e(e);
      emit(state.copyWith(
          status: Status.error, error: CommonException.setError(e)));
    }
  }

  Future<Result<List<ViewModule>>> _fetch(int tabId) async {
    return await _displayUsecase.execute(
        usecase: GetViewModulesUsecase(tabId: tabId));
  }
}
