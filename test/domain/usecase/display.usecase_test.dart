import 'dart:math';

import 'package:e_commerce_app/data/data_source/remote/display.api.dart';
import 'package:e_commerce_app/data/repository_impl/display.repository_impl.dart';
import 'package:e_commerce_app/domain/model/common/result.dart';
import 'package:e_commerce_app/domain/model/display/menu/menu.model.dart';
import 'package:e_commerce_app/domain/repository/display.repository.dart';
import 'package:e_commerce_app/domain/usecase/display/display.usecase.dart';
import 'package:e_commerce_app/domain/usecase/display/menu/get_menus.usecase.dart';
import 'package:e_commerce_app/presentation/pages/main/cubit/mall_type_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDisplayApi extends Mock implements DisplayApi {}

class MockDisplayRepository extends Mock implements DisplayRepository {}

class MockGetMenusUsecase extends Mock implements GetMenusUsecase {}

void main() {
  late DisplayRepository displayRepository;
  late DisplayUsecase displayUsecase;

  //테스트 환경을 설정하는 부분으로, 모든 테스트가 실행되기 전에 필요한 객체들을 초기화
  //테스트 간에 공통된 설정을 관리한다.
  setUpAll(() {
    //실제 API 호출을 하지 않고도 테스트할 수 있게 해 주며, 테스트가 실행되는 동안 가짜 데이터를 사용할 수 있게 한다.
    displayRepository = DisplayRepositoryImpl(MockDisplayApi());
    displayUsecase = DisplayUsecase(displayRepository);
  });

  test('의존성 주입 성공', () => expect(displayUsecase, isNotNull));

  test('메뉴 리스트 불러오기 성공', () async {
    final result = Result.Success([Menu(tabId: -1, title: '메뉴테스트')]);
    final usecase = MockGetMenusUsecase();

    when(() => usecase.mallType).thenReturn(MallType.market);
    when(() => usecase.call(displayRepository)).thenAnswer((_) async => result);

    final actual = await displayUsecase.execute(usecase: usecase);

    expect(actual, result);
  });
}
