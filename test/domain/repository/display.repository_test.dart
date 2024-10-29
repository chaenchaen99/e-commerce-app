import 'package:e_commerce_app/data/data_source/mock/display/display.mock_api.dart';
import 'package:e_commerce_app/data/data_source/remote/display.api.dart';
import 'package:e_commerce_app/data/dto/common/response_wrapper.dart';
import 'package:e_commerce_app/data/dto/display/menu/menu.dto.dart';
import 'package:e_commerce_app/data/mapper/common.mapper.dart';
import 'package:e_commerce_app/data/mapper/display.mapper.dart';
import 'package:e_commerce_app/data/repository_impl/display.repository_impl.dart';
import 'package:e_commerce_app/domain/model/display/menu/menu.model.dart';
import 'package:e_commerce_app/domain/repository/display.repository.dart';
import 'package:e_commerce_app/presentation/pages/main/bloc/cubit/mall_type_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDisplayApi extends Mock implements DisplayApi {}

void main() {
  late DisplayRepository displayRepository;
  late DisplayApi displayApi;

  setUpAll(() {
    displayApi = MockDisplayApi();
    displayRepository = DisplayRepositoryImpl(displayApi);
  });

  test('의존성 주입 및 객체 생성 완료', () => expect(displayRepository, isNotNull));

  group('메뉴 리스트 불러오기', () {
    //api 호출 성공
    test('api 호출 완료', () async {
      try {
        await displayRepository.getMenusByMallType(mallType: MallType.market);
      } catch (_) {}
      verify(() => displayApi.getMenusByMallType(any())).called(1);
    });

    test('api 호출 실패', () async {
      final exception = Exception('error');
      when(() => displayApi.getMenusByMallType(any())).thenThrow(exception);
      expect(
          () => displayRepository.getMenusByMallType(mallType: MallType.market),
          throwsA(exception));
    });

    test('api 성공적으로 불러옴', () async {
      final MallType mallType = MallType.market;

      //mockingData**는 실제 API 호출의 결과를 흉내 낸 가짜 데이터이다.
      //이 데이터는 이후 displayApi.getMenusByMallType(any())가 호출되면 반환한다.
      final ResponseWrapper<List<MenuDto>> mockingData =
          await DisplayMockApi().getMenusByMallType(mallType.name);

      //Mockito를 사용해 displayApi.getMenusByMallType(any())가 호출될 때 모킹된 응답인 mockingData를 반환하도록 설정.
      when(() => displayApi.getMenusByMallType(any()))
          .thenAnswer((_) async => mockingData);

      final actual =
          await displayRepository.getMenusByMallType(mallType: mallType);

      final expected = mockingData.toModel<List<Menu>>(
        mockingData.data?.map((menuDto) => menuDto.toModel()).toList() ?? [],
      );

      //실제 결과(actual)와 기대 값(expected)이 같은지 확인.
      expect(actual, expected);
    });
  });
}
