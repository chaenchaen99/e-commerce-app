import '../../data/dto/common/response_wrapper.dart';
import '../../presentation/pages/main/bloc/cubit/mall_type_cubit.dart';
import '../model/display/cart/cart.model.dart';
import '../model/display/display.model.dart';
import 'repository.dart';

abstract class DisplayRepository extends Repository {
  Future<ResponseWrapper<List<Menu>>> getMenusByMallType({
    required MallType mallType,
  });

  Future<ResponseWrapper<List<ViewModule>>> getViewModuleByTabId({
    required int tabId,
    required int page,
  });

  //장바구니 리스트 불러오기
  Future<ResponseWrapper<List<Cart>>> getCartList();

  //장바구니 담기
  Future<ResponseWrapper<List<Cart>>> addCartList({required Cart cart});

  //장바구니 아이템 삭제하기
  Future<ResponseWrapper<List<Cart>>> deleteCartByProductId(
      {required List<String> productIds});

  //장바구니 초기화(비우기)
  Future<ResponseWrapper<List<Cart>>> clearCartList();

  //장바구니 수량 변경하기
  Future<ResponseWrapper<List<Cart>>> changeCartQuantityByPrdId({
    required String productId,
    required int qty,
  });
}
