import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../presentation/pages/main/bloc/cart_bloc/cart_bloc.dart';
import '../../dto/common/response_wrapper.dart';
import '../../entity/display/cart/cart.entity.dart';

const String _cartDb = 'Cart_DB';

class DisplayDao {
  //장바구니 리스트 불러오기

  Future<ResponseWrapper<List<CartEntity>>> getCartList() async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);

    return ResponseWrapper(
      status: 'SUCCESS',
      code: '0000',
      message: '성공적으로 장바구니를 불러왔습니다.',
      data: localStorage.values.toList(),
    );
  }

  //장바구니 상품 담기
  Future<ResponseWrapper<List<CartEntity>>> insertCart(CartEntity cart) async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);
    final productId = cart.product.productId;

    if (localStorage.get(productId) != null) {
      final status = '이미 존재하는 상품 ::: ${cart.product.title}';
      final code = 'CART-1000';
      final message = '이미 장바구니에 존재하는 상품입니다.';

      return ResponseWrapper(
        status: status,
        code: code,
        message: message,
        data: localStorage.values.toList(),
      );
    }
    await localStorage.put(productId, cart);

    return ResponseWrapper(
      status: 'SUCCESS',
      code: '0000',
      message: '성공적으로 장바구니에 저장했습니다.',
      data: localStorage.values.toList(),
    );
  }

  //장바구니에 담긴 상품 삭제 by productId
  Future<ResponseWrapper<List<CartEntity>>> deleteCart(
    List<String> productIds,
  ) async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);
    await localStorage.deleteAll(productIds);

    return ResponseWrapper(
      status: 'SUCCESS',
      code: '0000',
      message: '성공적으로 $productIds 상품을 장바구니에서 삭제했습니다.',
      data: localStorage.values.toList(),
    );
  }

  //장바구니에 담긴 상품 전체 삭제
  Future<ResponseWrapper<List<CartEntity>>> clearCart() async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);
    await localStorage.clear();

    return ResponseWrapper(
      status: 'SUCCESS',
      code: '0000',
      message: '성공적으로 장바구니를 모두 비웠습니다.',
      data: [],
    );
  }

  //장바구니 수량 변경
  Future<ResponseWrapper<List<CartEntity>>> changeQuantityCart(
    String productId,
    int quantity,
  ) async {
    final localStorage = await Hive.openBox<CartEntity>(_cartDb);
    final curCart = await localStorage.get(productId);

    if (curCart == null) {
      final status = '장바구니 객체가 존재하지 않습니다.';
      final code = 'CART-1001';
      final message = '네트워크 오류가 발생했습니다. 잠시 후에 다시 시도해 주세요.';

      return ResponseWrapper(
        status: status,
        code: code,
        message: message,
        data: localStorage.values.toList(),
      );
    }
    final nextCart = CartEntity(product: curCart.product, quantity: quantity);
    await localStorage.put(productId, nextCart);

    return ResponseWrapper(
      status: 'SUCCESS',
      code: '0000',
      message: '성공적으로 ${curCart.product.title}의 수량을 변경완료했습니다.',
      data: localStorage.values.toList(),
    );
  }
}
