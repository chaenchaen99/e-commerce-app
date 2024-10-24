part of 'view_module_bloc.dart';

@freezed
class ViewModuleState with _$ViewModuleState {
  const factory ViewModuleState({
    @Default(Status.initial) Status status,
    @Default(ErrorResponse()) ErrorResponse error,
    @Default(-1) int tabId,
    @Default(<Widget>[]) List<Widget> viewModules,
  }) = _ViewModuleState;
}
