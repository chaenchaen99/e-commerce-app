import '../../repository/display.repository.dart';
import '../base/remote.usecase.dart';

class DisplayUsecase {
  final DisplayRepository _displayReposioty;

  DisplayUsecase(this._displayReposioty);

  Future execute<T>({required RemoteUsecase usecase}) async {
    return await usecase(_displayReposioty);
  }
}
