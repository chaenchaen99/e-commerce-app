part of 'view_module_bloc.dart';

abstract class ViewModuleEvent {
  const ViewModuleEvent();
}

class ViewModuleInitialized implements ViewModuleEvent {
  final int tabId;
  final bool isRefresh;

  const ViewModuleInitialized({
    required this.tabId,
    this.isRefresh = false,
  });
}

class ViewModuleFetched extends ViewModuleEvent {
  ViewModuleFetched();
}
