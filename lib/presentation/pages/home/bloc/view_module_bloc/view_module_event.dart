part of 'view_module_bloc.dart';

abstract class ViewModuleEvent {
  const ViewModuleEvent();
}

class ViewModuleInitialized implements ViewModuleEvent {
  final int tabId;
  const ViewModuleInitialized(this.tabId);
}

class ViewModuleFetched extends ViewModuleEvent {
  ViewModuleFetched();
}
