import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../dto/common/response_wrapper.dart';
import '../../../dto/display/menu/menu.dto.dart';
import '../../../dto/display/view_module/view_module.dto.dart';
import '../../remote/display.api.dart';
import 'display_mock_data.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(String mallType) {
    return Future(
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        message: '',
        data: _menuParser(mallType == 'market'
            ? DisplayMockData.menusByMarket
            : DisplayMockData.menusByBeauty),
      ),
    );
  }

  List<MenuDto> _menuParser(String source) {
    List<MenuDto> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => MenuDto.fromJson(e)).toList();

    return menus;
  }

  @override
  Future<ResponseWrapper<List<ViewModuleDto>>> getViewModulesByTabId(
    int tabId,
    int page,
  ) {
    if (page == 4) {
      return Future(
        () => ResponseWrapper(
          status: 'SUCCESS',
          code: '0000',
          message: '',
          data: [],
        ),
      );
    }

    String source = DisplayMockData.getViewModules();

    return Future(
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        message: '',
        data: _viewModuleParser(source),
      ),
    );
  }

  List<ViewModuleDto> _viewModuleParser(String source) {
    List<ViewModuleDto> viewModules = [];
    final List json = jsonDecode(source);
    viewModules = json.map((e) => ViewModuleDto.fromJson(e)).toList();

    return viewModules;
  }
}
