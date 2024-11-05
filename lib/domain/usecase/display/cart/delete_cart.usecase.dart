import '../../../../core/utils/error/error_response.dart';
import '../../../../core/utils/extensions.dart';
import '../../../model/common/result.dart';
import '../../../repository/display.repository.dart';
import '../../base/local.usecase.dart';

class DeleteCartUsecase extends LocalUsecase<DisplayRepository> {
  final List<String> productIds;

  DeleteCartUsecase(this.productIds);

  @override
  Future call(DisplayRepository repository) async {
    final result =
        await repository.deleteCartByProductId(productIds: productIds);

    return result.status.isSuccess
        ? Result.success(result.data)
        : Result.failure(ErrorResponse(
            status: result.status,
            code: result.code,
            message: result.message,
          ));
  }
}
