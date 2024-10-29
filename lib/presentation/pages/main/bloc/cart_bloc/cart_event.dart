part of 'cart_bloc.dart';

abstract class CartEvent {
  CartEvent();
}

class CartInitialized extends CartEvent {
  CartInitialized();
}

class CartClosed extends CartEvent {
  CartClosed();
}

class CartOpened extends CartEvent {
  final ProductInfo productInfo;
  final int quantity;

  CartOpened(this.productInfo, this.quantity);
}
